//
//  ActivityIndicator.swift
//  CountriesList
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit

class ActivityIndicator {
    static func showActivityIndicator (viewController : UIViewController) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.color = UIColor.black
        activityIndicator.center = viewController.view.center
        activityIndicator.startAnimating()
        viewController.view.addSubview(activityIndicator)
        
        return activityIndicator
    }
    static func hideActivityIndicator (activityIndicator : UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
