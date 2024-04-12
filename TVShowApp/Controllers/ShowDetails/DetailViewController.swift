//
//  DetailViewController.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 09/04/2024.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: DynamicHeightTableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var readMoreBtn: UIButton!
    
    //MARK: Properties
    var seasonsList = Season.getDummyData()
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupTableView()
        self.setupCollectionView()
        self.setupReadMoreBtn()
    }
    
    //MARK: IBActions
    @IBAction func didTapReadMore(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.toggleReadMore(sender.isSelected)
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
        self.updateSeasonSelection(0)
    }
    
    func setupReadMoreBtn(){
        self.readMoreBtn.isHidden = !self.overviewLabel.isTruncated
    }

    //MARK: Methods
    func toggleReadMore(_ isSelected: Bool) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.overviewLabel.numberOfLines = isSelected ? 0 : 3
            self?.view.layoutIfNeeded()
        }
    }
    
    func updateSeasonSelection(_ index: Int?) {
        self.seasonsList = seasonsList.enumerated().compactMap { (i, season) in
            var mutableSeason = season
            mutableSeason.isSelected = (i == index) ? true : false
            return mutableSeason
        }
        self.collectionView.reloadData()
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(withType: EpisodeTableViewCell.self, for: indexPath) as! EpisodeTableViewCell
        
        cell.configure()
        return cell
    }
    
}

//MARK: CollectionViewDelegate
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(withType: MenuBarCollectionViewCell.self, for: indexPath) as! MenuBarCollectionViewCell
        cell.configure(seasonsList[indexPath.item])
        cell.itemSeprator.isHidden = (indexPath.item == (seasonsList.count - 1)) ? true : false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.updateSeasonSelection(indexPath.item)
        
    }
    
}
