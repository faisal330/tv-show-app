//
//  Loader.swift
//  TVShowApp
//
//  Created by Faisal Shahzad on 13/04/2024.
//

import UIKit

class Loader {
    
    private static var retainCouner = 0
    private static var loader: UIView?
    private static var imageView : UIImageView?
    private static var progressView: UIView?
    private static var textLabel: UILabel?

    
    public static var animationDuration = 0.75 {
        didSet {
            imageView?.animationDuration = animationDuration
            if imageView != nil {
                show()
            }
        }
    }
    
    static func show() {
        
        if retainCouner != 0 {
            retainCouner += 1;
            return;
        }

        loader?.removeFromSuperview()
        loader = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        loader?.translatesAutoresizingMaskIntoConstraints = false
        guard let window = SceneDelegate.shared?.window else {
            return
        }
        window.addSubview(loader!)
        
        retainCouner += 1;

        loader?.topAnchor.constraint(equalTo: window.topAnchor, constant: 0).isActive = true
        loader?.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: 0).isActive = true
        loader?.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 0).isActive = true
        loader?.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: 0).isActive = true
        
        loader?.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.40);
        animateImages()

    }
    
    static func dismiss(_ forced : Bool = false, deadline: Double = 0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + deadline) {
            retainCouner -= 1;
            print("dismissCounter = \(retainCouner)")
            
            if retainCouner > 0 && forced == false {
                return;
            }
            
            DispatchQueue.main.async {
                imageView?.stopAnimating()
                loader?.removeFromSuperview()
                progressView?.removeFromSuperview()
            }
            
            retainCouner = 0;
        }
    }
    
    private static func animateImages() {
        guard let loader = loader else {
            return
        }
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        loader.addSubview(containerView)
        containerView.widthAnchor.constraint(equalToConstant: 130).isActive = true // image width
        containerView.heightAnchor.constraint(equalToConstant: 130).isActive = true // image height
        containerView.centerXAnchor.constraint(equalTo: loader.centerXAnchor, constant: 0).isActive = true
        containerView.centerYAnchor.constraint(equalTo: loader.centerYAnchor, constant: 0).isActive = true
        
        imageView = UIImageView()
        imageView?.contentMode = .scaleAspectFit
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageView!)
        imageView?.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        imageView?.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        imageView?.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5).isActive = true
        
        imageView?.image = UIImage.gif(name: "loader")
    }
}
