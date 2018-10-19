//
//  SplashVController.swift
//  CountriesList
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit
import RevealingSplashView
import Firebase


class SplashVController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        RSView(viewController: self, iconImage: "icon", iconWidth: 256, iconHeight: 256, backgroundImage: "bg")
        
        Firebase.goToSignInOrHome(viewController: self)
    }
}
