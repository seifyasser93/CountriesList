//
//  RSView.swift
//  CountriesList
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit
import RevealingSplashView

func RSView(viewController : UIViewController, iconImage : String, iconWidth : CGFloat, iconHeight : CGFloat, backgroundImage : String) {
     //Initialize a revealing Splash with with the iconImage, the initial size and the background color
     let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: iconImage)!,iconInitialSize: CGSize(width: iconWidth, height: iconHeight), backgroundImage: UIImage(named: backgroundImage)!)
     
     //Adds the revealing splash view as a sub view
     viewController.view.addSubview(revealingSplashView)
     
     //Animation of type squeeze and zoom out
     revealingSplashView.animationType = SplashAnimationType.squeezeAndZoomOut
     
     //Starts animation
     revealingSplashView.startAnimation()
}
