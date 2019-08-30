//
//  MainViewController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/26/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import UIKit
import Firebase


class MainViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
   
    @IBOutlet var signInButton: UIButton!
    
    @IBOutlet var signoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        signInButton.layer.borderWidth = 4
        signInButton.layer.cornerRadius = 10
        signInButton.layer.shadowRadius = 2
        signInButton.layer.shadowOffset = .zero
        signInButton.layer.shadowOpacity = 1
        signInButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        signInButton.layer.borderColor = AppearanceHelper.sunny.cgColor
        signInButton.backgroundColor = AppearanceHelper.bergonia
        
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 4
        mainView.layer.borderColor = AppearanceHelper.bergonia.cgColor
        signoutButton.layer.borderWidth = 4
        signoutButton.layer.cornerRadius = 10
        signoutButton.layer.shadowRadius = 2
        signoutButton.layer.shadowOffset = .zero
        signoutButton.layer.shadowOpacity = 1
        signoutButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        signoutButton.layer.borderColor = AppearanceHelper.sunny.cgColor
        signoutButton.backgroundColor = AppearanceHelper.bergonia
        
        if Auth.auth().currentUser?.uid == nil {
            guard let onboardVC = storyboard?.instantiateViewController(withIdentifier: "OnboardView") else {return}
            present(onboardVC, animated: true, completion: nil)
        }
        
    }
    
    func setupBackground() {
        let twitterBird = TwiterBirdView()
        twitterBird.twitterImage = UIImage(named: "twitterBird")
        twitterBird.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twitterBird)
        view.sendSubviewToBack(twitterBird)
        NSLayoutConstraint.activate([twitterBird.leadingAnchor.constraint(equalTo: view.leadingAnchor),twitterBird.trailingAnchor.constraint(equalTo: view.trailingAnchor),twitterBird.topAnchor.constraint(equalTo: view.topAnchor), twitterBird.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func signoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let signOut = UIAlertController(title: "You've Been Signed Out!", message: "Click OK To Continue", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            signOut.addAction(okAction)
            present(signOut, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        
    }
}
