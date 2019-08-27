//
//  SinglePlayerViewController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/27/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import UIKit

class SinglePlayerViewController: UIViewController {
    @IBOutlet var endGameButton: UIButton!
    
    @IBOutlet var answerButtonOne: UIButton!
    @IBOutlet var progressBar: UIView!
    @IBOutlet var answerButtonTwo: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet var tweetLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var answerButtonThree: UIButton!
    
    @IBOutlet var accountButton: UIButton!
    
    @IBOutlet var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
       
        levelLabel.layer.shadowRadius = 2
        levelLabel.layer.shadowOffset = .zero
        levelLabel.layer.shadowOpacity = 1
        levelLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        accountButton.layer.borderWidth = 4
        accountButton.layer.cornerRadius = 10
        accountButton.layer.shadowRadius = 2
        accountButton.layer.shadowOffset = .zero
        accountButton.layer.shadowOpacity = 1
        accountButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        accountButton.layer.borderColor = AppearanceHelper.sunny.cgColor
        accountButton.backgroundColor = AppearanceHelper.bergonia
        
        endGameButton.layer.borderWidth = 1
        endGameButton.layer.cornerRadius = 10
        endGameButton.layer.shadowRadius = 2
        endGameButton.layer.shadowOffset = .zero
        endGameButton.layer.shadowOpacity = 1
        endGameButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        endGameButton.layer.borderColor = AppearanceHelper.sunny.cgColor
        endGameButton.backgroundColor = AppearanceHelper.bergonia
        
        profileImage.layer.cornerRadius = 15
        
        mainView.layer.borderColor = AppearanceHelper.bergonia.cgColor
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 4
        
        
        
        answerButtonOne.layer.borderWidth = 4
        answerButtonOne.layer.cornerRadius = 10
        answerButtonOne.layer.shadowRadius = 2
        answerButtonOne.layer.shadowOffset = .zero
        answerButtonOne.layer.shadowOpacity = 1
        answerButtonOne.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        answerButtonOne.layer.borderColor = AppearanceHelper.sunny.cgColor
        answerButtonOne.backgroundColor = AppearanceHelper.bergonia
        
        answerButtonTwo.layer.borderWidth = 4
        answerButtonTwo.layer.cornerRadius = 10
        answerButtonTwo.layer.shadowRadius = 2
        answerButtonTwo.layer.shadowOffset = .zero
        answerButtonTwo.layer.shadowOpacity = 1
        answerButtonTwo.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        answerButtonTwo.layer.borderColor = AppearanceHelper.sunny.cgColor
        answerButtonTwo.backgroundColor = AppearanceHelper.bergonia
        
        answerButtonThree.layer.borderWidth = 4
        answerButtonThree.layer.cornerRadius = 10
        answerButtonThree.layer.shadowRadius = 2
        answerButtonThree.layer.shadowOffset = .zero
        answerButtonThree.layer.shadowOpacity = 1
        answerButtonThree.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        answerButtonThree.layer.borderColor = AppearanceHelper.sunny.cgColor
        answerButtonThree.backgroundColor = AppearanceHelper.bergonia
        
        
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
    
}
