//
//  SignUpVController.swift
//  Countries List
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit

class SignUpVController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordconfTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupBU(_ sender: UIButton) {
        Firebase.signUp(viewController: self, emailTextField: emailTF, passwordTextField: passwordTF, passwordConfTextField: passwordconfTF)
    }
}
