//
//  Firebase.swift
//  CountriesList
//
//  Created by Seif Yasser on 10/19/18.
//  Copyright © 2018 Seif Yasser. All rights reserved.
//

import UIKit
import Firebase

class Firebase {
    static func signUp(viewController : UIViewController, emailTextField : UITextField, passwordTextField : UITextField, passwordConfTextField : UITextField) {
        let showAcivityInd = ActivityIndicator.showActivityIndicator(viewController: viewController)
        
        guard let email = emailTextField.text, email != "",
            let password = passwordTextField.text, password != "",
            let passwordconf = passwordConfTextField.text, passwordconf != "", password == passwordconf
            else {
                AlertController.showAlert(viewController, title: "Missing Information", message: "Please, fill all the fields")
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard error == nil
                else {
                    AlertController.showAlert(viewController, title: "Error", message: error!.localizedDescription)
                    return
            }
            
            guard let user = user?.user
                else {
                    return
            }
            
            print(user.email ?? "Missing E-mail")
            print(user.uid)
            
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = email
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil
                    else {
                        AlertController.showAlert(viewController, title: "Error", message: error!.localizedDescription)
                        return
                }
                
                ActivityIndicator.hideActivityIndicator(activityIndicator: showAcivityInd)
                
                viewController.performSegue(withIdentifier: "SignUpSegue", sender: nil)
            })
        }
    }
    
    static func signIn(viewController : UIViewController, emailTextField : UITextField, passwordTextField : UITextField) {
        let showAcivityInd = ActivityIndicator.showActivityIndicator(viewController: viewController)
        
        guard let email = emailTextField.text, email != "",
            let password = passwordTextField.text, password != ""
            else {
                AlertController.showAlert(viewController, title: "Missing Information", message: "Please fill all the fields")
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil
                else {
                    AlertController.showAlert(viewController, title: "Error", message: error!.localizedDescription)
                    return
            }
            
            guard let user = user?.user
                else {
                    return
            }
            
            print(user.email ?? "Missing E-mail")
            print(user.uid)
            
            ActivityIndicator.hideActivityIndicator(activityIndicator: showAcivityInd)
            
            viewController.performSegue(withIdentifier: "SignInSegue", sender: nil)
        }
    }
    
    static func SignOut(viewController : UIViewController) {
        let showAcivityInd = ActivityIndicator.showActivityIndicator(viewController: viewController)
        
        do {
            try Auth.auth().signOut()
            
            ActivityIndicator.hideActivityIndicator(activityIndicator: showAcivityInd)
            
            viewController.performSegue(withIdentifier: "SignOutSegue", sender: nil)
        } catch {
            print("Sign Out Error")
        }
    }
    
    static func ShowDisplayName(welcomeUserLabel : UILabel) {
        guard let email = Auth.auth().currentUser?.displayName else { return }
        welcomeUserLabel.text = email
    }
    
    static func goToSignInOrHome(viewController : UIViewController) {
        if Auth.auth().currentUser?.displayName == nil {
            let showAcivityInd = ActivityIndicator.showActivityIndicator(viewController: viewController)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
                viewController.performSegue(withIdentifier: "GoToSignIn", sender: nil)
                ActivityIndicator.hideActivityIndicator(activityIndicator: showAcivityInd)
            })
        }
        else {
            let showAcivityInd = ActivityIndicator.showActivityIndicator(viewController: viewController)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
                viewController.performSegue(withIdentifier: "GoToHome", sender: nil)
                ActivityIndicator.hideActivityIndicator(activityIndicator: showAcivityInd)
            })
        }
        
    }
}
