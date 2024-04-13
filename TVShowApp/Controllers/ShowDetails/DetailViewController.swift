//
//  DetailViewController.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 09/04/2024.
//

import UIKit
import AVKit

class DetailViewController: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: DynamicHeightTableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var readMoreBtn: UIButton!
    
    @IBOutlet weak var seriesBannerImageView: UIImageView!
    @IBOutlet weak var seriesTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var seasonCountLabel: UILabel!
    @IBOutlet weak var ratingSystemLabel: UILabel!
    
    
    //MARK: Properties
    var seriesDetail: SeriesInfo?
    var seasonsList: [Season]?
    var seasonsDetail: SeasonInfo?
    
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupTableView()
        self.setupCollectionView()
        
        self.fetchSeriesDetail(id: "71712")
//        self.fetchSeriesDetail(id: "62852")
        
        
        
    }
    
    //MARK: IBActions
    @IBAction func didTapReadMore(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.toggleReadMore(sender.isSelected)
    }
    
    @IBAction func didTapPlayBtn(_ sender: UIButton) {
        let url = URL(string: ConfigurationManager.shared.infoForKey(.videoURL) ?? "")!
        playVideo(url: url)
    }
    
    @IBAction func didTapTrailerBtn(_ sender: UIButton) {
        let url = URL(string: ConfigurationManager.shared.infoForKey(.videoURL) ?? "")!
        playVideo(url: url)
    }
    
    //MARK: Configure
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell(type: EpisodeTableViewCell.self)
    }
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCell(type: MenuBarCollectionViewCell.self)
    }
    
    func setupReadMoreBtn(){
        self.readMoreBtn.isHidden = self.overviewLabel.isTruncated
    }

    //MARK: Methods
    func toggleReadMore(_ isSelected: Bool) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.overviewLabel.numberOfLines = isSelected ? 0 : 3
            self?.view.layoutIfNeeded()
        }
    }
    
    func updateSeasonSelection(_ season: Season?) {
        self.seasonsList = seasonsList?.compactMap { item in
            var mutableSeason = item
            mutableSeason.isSelected = (item.id == season?.id) ? true : false
            return mutableSeason
        }
        self.collectionView.reloadData()
        self.fetchSeasonDetail(seriesId: String(self.seriesDetail?.id ?? 0), seasonNo: String(season?.season_number ?? 0))
    }
    
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        self.present(vc, animated: true) { vc.player?.play() }
    }
    
    func prepareData() {
        self.seriesBannerImageView.setImagesFromCacheOrRefresh(url: URLHelper.shared.getImageURL(with: self.seriesDetail?.backdrop_path ?? ""))
        self.seriesTitleLabel.text = self.seriesDetail?.name?.condensingWhitespace().capitalized
        self.releaseYearLabel.text = Date.getFormattedDate(string: self.seriesDetail?.first_air_date, format: Constants.yyyy)
        self.seasonCountLabel.text = "\(self.seriesDetail?.number_of_seasons ?? 0) \((self.seriesDetail?.number_of_seasons ?? 0) > 1 ? "Seasons" : "Season")"
        self.ratingSystemLabel.text = (self.seriesDetail?.adult ?? false) ? "R" : "PG"
        self.overviewLabel.text = self.seriesDetail?.overview?.condensingWhitespace()
        self.setupReadMoreBtn()
        self.seasonsList = self.seriesDetail?.seasons
        self.updateSeasonSelection(self.seasonsList?.first)
    }
}


//MARK: SrollViewDelegate
extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = self.scrollView.contentOffset.y / 150
        if offset > 1 {
            offset = 1
            navBarView.backgroundColor = UIColor.Color_111012.withAlphaComponent(offset)
        } else {
            navBarView.backgroundColor = UIColor.Color_111012.withAlphaComponent(offset)
        }
    }
}

//MARK: TableViewDelegate
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.seasonsDetail?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: EpisodeTableViewCell.self, for: indexPath) as! EpisodeTableViewCell
        
        cell.configure(self.seasonsDetail?.episodes?[indexPath.row])
        cell.didPlayContent = { [weak self] in
            guard let self else { return }
            let url = URL(string: ConfigurationManager.shared.infoForKey(.videoURL) ?? "")!
            self.playVideo(url: url)
        }
        
        return cell
    }
    
}

//MARK: CollectionViewDelegate
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(withType: MenuBarCollectionViewCell.self, for: indexPath) as! MenuBarCollectionViewCell
        cell.configure(seasonsList?[indexPath.item])
        cell.itemSeprator.isHidden = (indexPath.item == ((seasonsList?.count ?? 0) - 1)) 
        ? true : false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if let season = seasonsList?[indexPath.item], let selected = season.isSelected, !selected {
            self.updateSeasonSelection(seasonsList?[indexPath.item])
        }
    }
}

//MARK: API Calling
extension DetailViewController {
    func fetchSeriesDetail(id: String) {
        
        Loader.show()
        SeriesService.shared.getSeriesDetail(id: id) { [weak self] (response) in
            guard let self else {return}
            Loader.dismiss()
            switch response {
            case .success(let details):
                self.seriesDetail = details
                self.prepareData()
            case .failure(let error):
                self.alert(message: error.localizedDescription)
            }
        }
    }
    
    func fetchSeasonDetail(seriesId: String, seasonNo: String) {
        
        Loader.show()
        SeriesService.shared.getSeasonDetail(seriesId: seriesId, seasonNo: seasonNo) { [weak self] (response) in
            
            guard let self else {return}
            Loader.dismiss(deadline: 2.5)

            switch response {
            case .success(let details):
                self.seasonsDetail = details
                self.tableView.reloadData()
                
            case .failure(let error):
                self.alert(message: error.localizedDescription)
            }
        }
    }
}
