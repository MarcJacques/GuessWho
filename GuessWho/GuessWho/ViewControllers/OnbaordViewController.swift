//
//  OnbaordViewController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/27/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import UIKit

class OnbaordViewController: UIViewController {

    @IBOutlet var iGotItButton: UIButton!
    @IBOutlet var instructionsView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var instructionsLabel: UILabel!
    
    @IBOutlet var gamePlayScreenShot: UIImageView!
    var buttonCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        mainView.layer.borderColor = AppearanceHelper.bergonia.cgColor
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 4
        instructionsView.layer.borderColor = AppearanceHelper.sunny.cgColor
        instructionsView.layer.borderWidth = 4
        instructionsView.layer.cornerRadius = 10
        instructionsView.layer.shadowRadius = 10
        instructionsView.layer.shadowOffset = .zero
        instructionsView.layer.shadowOpacity = 1
        instructionsView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        iGotItButton.layer.borderWidth = 4
        iGotItButton.layer.cornerRadius = 10
        iGotItButton.layer.shadowRadius = 10
        iGotItButton.layer.shadowOffset = .zero
        iGotItButton.layer.shadowOpacity = 1
        iGotItButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        iGotItButton.layer.borderColor = AppearanceHelper.sunny.cgColor
        iGotItButton.setTitle("I Got It!", for: .normal)
        iGotItButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        iGotItButton.backgroundColor = AppearanceHelper.bergonia
        
        
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
    @IBAction func iGotItButtonTapped(_ sender: UIButton) {
        buttonCounter += 1
        switch buttonCounter {
        case 1:
            instructionsLabel.text = "Every Correct Answer Will Get You that much closer to the next level!"
        case 2:
            instructionsLabel.text = "You Only Have Three Lives!"
            iGotItButton.setTitle("Get Started!", for: .normal)
        default:
            instructionsLabel.text = "Press The Button Below to Start!"
        }
    }
}
