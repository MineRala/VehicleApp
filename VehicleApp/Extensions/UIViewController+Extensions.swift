//
//  UIViewController+Extension.swift
//  VehicleApp
//
//  Created by Mine Rala on 8.04.2023.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        self.view.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.alpha = 0
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        var activityIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        containerView.addSubview(activityIndicator)
        activityIndicator.color = UIColor.Palette.solidGreen
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        containerView?.removeFromSuperview()
        containerView = nil
    }
    
    func openView(vc: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.backgroundColor = UIColor.Palette.azure
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    
    
    
}
