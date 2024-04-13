//
//  EpisodeTableViewCell.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 12/04/2024.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeDownloadBtn: UIButton!
    @IBOutlet weak var episodePlayView: UIView!
    @IBOutlet weak var episodePlayBtn: UIButton!
    @IBOutlet weak var episodeExpandBtn: UIButton!
    
    var didPlayContent: (()->Void)?
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: IBActions
    @IBAction func didTapExpandBtn(_ sender: UIButton) {
        /* Missing functionality for the expanding cell */
    }
    
    @IBAction func didTapPlayBtn(_ sender: UIButton) {
        self.didPlayContent?()
    }
    
    @IBAction func didTapDownloadBtn(_ sender: UIButton) {
        /* Missing functionality for the content download */

    }
    
    //MARK: Configure
    func configure(_ episode: Episode?) {
        self.episodeTitleLabel.text = "E\(episode?.episode_number ?? 0) - \(episode?.name ?? "")"
        self.episodeImageView.setImagesFromCacheOrRefresh(
            url: URLHelper.shared.getImageURL(with: episode?.still_path ?? ""))
    }
}
