//
//  LoginSignupViewController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/27/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import UIKit
enum LoginType {
    case signUp
    case signIn
}

class LoginSignupViewController: UIViewController {

    var loginType = LoginType.signUp
    
    @IBOutlet var signUpLoginSegmentedControl: UISegmentedControl!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signupLoginButton: UIButton!
    var apiController: APIController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupLoginButton.layer.borderWidth = 4
         signupLoginButton.layer.cornerRadius = 10
         signupLoginButton.layer.shadowRadius = 2
         signupLoginButton.layer.shadowOffset = .zero
         signupLoginButton.layer.shadowOpacity = 1
         signupLoginButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
         signupLoginButton.layer.borderColor = AppearanceHelper.sunny.cgColor
         signupLoginButton.backgroundColor = AppearanceHelper.bergonia

    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    
    
    @IBAction func loginSignUPButtonTapped(_ sender: Any) {
        
//        guard let apiController = apiController else {return}
//        if let username = userNameTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty {
//
//            let user = User(
//
//            if loginType == .signUp {
//                apiController.signUp(user: user) { error in
//                    if let error = error {
//                        print("Error occured during signup: \(error)")
//                    } else {
//                        DispatchQueue.main.async {
//
//                            let alertController = UIAlertController(title: "Sign Up Successful", message: "Now Login!!!!", preferredStyle: .alert)
//                            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                            alertController.addAction(alertAction)
//                            self.present(alertController,animated: true, completion: {
//                                self.loginType = .signIn
//                                self.signUpLoginSegmentedControl.selectedSegmentIndex = 1
//                                self.signupLoginButton.setTitle("Sign In", for: .normal)
//
//                            })
//
//                        }
//
//
//                    }
//                }
//
//            } else {
//                gigController.logIn(user: user) { error in
//                    if let error = error {
//
//                        print("Error occured during sign up: \(error)")
//
//                    } else {
//
//                        DispatchQueue.main.async {
//                            self.dismiss(animated: true, completion: nil)
//                        }
//                    }
//                }
//
//            }
//        }
//    }
    
    
    
    
    
//    @IBAction func signUpLoginStateChanged(_ sender: Any) {
//        if signUpLoginSegmentedControl.selectedSegmentIndex == 0 {
//
//            loginType = .signUp
//            signupLoginButton.setTitle("Sign Up", for: .normal)
//
//        }
//        else {
//            loginType = .signIn
//            signupLoginButton.setTitle("Log In", for: .normal)
//
//        }
//    }
//

}
}
