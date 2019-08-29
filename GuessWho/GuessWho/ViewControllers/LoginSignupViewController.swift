//
//  LoginSignupViewController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/27/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import UIKit
import Firebase
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
        signupLoginButton.setTitle("Sign Up", for: .normal)
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
        
        guard let email = userNameTextField.text, let password = passwordTextField.text else {return}
        
        if loginType == .signUp {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    print("Error occured during signup: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign Up Successful", message: "Now Login!!!!", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController,animated: true, completion: {
                            self.loginType = .signIn
                            self.signUpLoginSegmentedControl.selectedSegmentIndex = 1
                            self.signupLoginButton.setTitle("Sign In", for: .normal)
                        })
                    }
                }
            }
        }
        else if loginType == .signIn {
            Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let error = error {
                    NSLog("Error Signing In: \(error)")
                } else if let user = user {
                    print(user.credential as Any)
                    DispatchQueue.main.async {
                        let mainView = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
                        self.present(mainView!, animated: true, completion: nil)
                        guard let userID = Auth.auth().currentUser?.uid else {return}
                    }
                }
            }
        }
    }
    
    
    @IBAction func loginSignUpStateChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginType = LoginType.signUp
            signupLoginButton.setTitle("Sign Up", for: .normal)
        } else if sender.selectedSegmentIndex == 1 {
            loginType = LoginType.signIn
            signupLoginButton.setTitle("Sign In", for: .normal)
        }
    }
    
}
