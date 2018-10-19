//
//  ViewController.swift
//  CountriesList
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit

class SignInVController: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignInBU(_ sender: UIButton) {
        Firebase.signIn(viewController: self, emailTextField: emailTF, passwordTextField: passwordTF)
    }
}

