//
//  UIImageView+Ext.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImagesFromCacheOrRefresh(url:String, placeholder: String = "ic_banner_placeholder", completion: ((Bool) -> Void)? = nil)  {
        
        guard let urlStr = URL(string: url) else {
            completion?(false)
            self.image = UIImage(named: placeholder)
            return
        }
        
        let resource = KF.ImageResource(downloadURL: urlStr, cacheKey: url)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: resource,
            placeholder: UIImage(named: placeholder),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.none),
                .cacheOriginalImage,
                .onFailureImage(UIImage(named: placeholder))
            ])
        {
            result in
            switch result {
            case .success(_):
                completion?(true)
                
            case .failure(let error):
                completion?(false)
                print("Error: ", urlStr)
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
