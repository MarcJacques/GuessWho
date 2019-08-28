//
//  SinglePlayerViewController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/27/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import UIKit

class SinglePlayerViewController: UIViewController {
    
    @IBOutlet var farLeftHeart: UIImageView!
    @IBOutlet var middleHeart: UIImageView!
    @IBOutlet var rightHeart: UIImageView!
    @IBOutlet var endGameButton: UIButton!
    @IBOutlet var answerButtonOne: UIButton!
    @IBOutlet var answerButtonTwo: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet var tweetLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var answerButtonThree: UIButton!
    @IBOutlet var accountButton: UIButton!
    @IBOutlet var levelLabel: UILabel!
    
    let apiController = APIController()
    var buttons: [UIButton] = []
    var successCounter = 0
    var failureCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(successCounter)
        setupBackground()
        setupView()
        apiController.getTweet { (result) in
            guard let result = try? result.get() else {return}
            DispatchQueue.main.async {
                self.tweetLabel.text = result.statuses[0].text
            }
        }
        buttonGeneration()
            
        }
        
    
    
    func buttonGeneration() {
        answerButtonOne.setTitle("@\(String(describing: apiController.presidentsNames.randomElement()!))", for: .normal)
        answerButtonTwo.setTitle("@\(String(describing: apiController.presidentsNames.randomElement()!).capitalized)", for: .normal)
        answerButtonThree.setTitle("@\(String(describing: apiController.presidentsNames.randomElement()!).capitalized)", for: .normal)
        buttons.append(answerButtonOne)
        buttons.append(answerButtonTwo)
        buttons.append(answerButtonThree)
       buttons.randomElement()!.setTitle("\(String(describing: apiController.random!))", for: .normal)
    }

    func setupView() {
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
    
    @IBAction func answerButtonOneTapped(_ sender: UIButton) {
         guard let randomString = apiController.random else {return}
        print(randomString)
        if (answerButtonOne.currentTitle?.contains(randomString))! && successCounter < 3 {
            let progressAlertController = UIAlertController(title: "Correct!", message: "Keep Going", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            progressAlertController.addAction(okAction)
            present(progressAlertController, animated: true, completion: nil)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if successCounter >= 3  {
            correctAnswer(successCounter: successCounter)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if successCounter >= 6{
            correctAnswer(successCounter: successCounter)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        }   else if successCounter >= 9 {
                correctAnswer(successCounter: successCounter)
            successCounter = 0

        } else if !(answerButtonOne.currentTitle?.contains(randomString))!{
            failureCounter += 1
            wrongAnswer(failureCounter: failureCounter)
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if !(answerButtonOne.currentTitle?.contains(randomString))! && failureCounter > 1 && failureCounter < 3{
            print("Hit the second failure statement")
            failureCounter += 1
            wrongAnswer(failureCounter: failureCounter)
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if !(answerButtonOne.currentTitle?.contains(randomString))! && failureCounter == 3 {
            print("Hit the third failure statement")
            wrongAnswer(failureCounter: failureCounter)
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        }
    }
    

    @IBAction func answerButtonTwo(_ sender: UIButton) {
        guard let randomString = apiController.random else {return}
        print(randomString)
        if (answerButtonTwo.currentTitle?.contains(randomString))! && successCounter < 3 {
            let progressAlertController = UIAlertController(title: "Correct!", message: "Keep Going", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            progressAlertController.addAction(okAction)
            present(progressAlertController, animated: true, completion: nil)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
            
        } else if successCounter >= 3  {
            correctAnswer(successCounter: successCounter)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if successCounter >= 6{
            correctAnswer(successCounter: successCounter)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        }   else if successCounter >= 9 {
            correctAnswer(successCounter: successCounter)
            successCounter = 0
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
            
        } else if failureCounter > 0 && failureCounter < 3 {
            let wrongAnswerAlertController = UIAlertController(title: "Wrong!", message: "Try Again!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            wrongAnswerAlertController.addAction(okAction)
            present(wrongAnswerAlertController, animated: true, completion: nil)
            failureCounter += 1
            wrongAnswer(failureCounter: failureCounter)
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if failureCounter == 3 {
            wrongAnswer(failureCounter: failureCounter)
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        }
    }
    @IBAction func answerButtonThree(_ sender: UIButton) {
        guard let randomString = apiController.random else {return}
        print(randomString)
        if (answerButtonThree.currentTitle?.contains(randomString))! && successCounter < 3 {
            let progressAlertController = UIAlertController(title: "Correct!", message: "Keep Going", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            progressAlertController.addAction(okAction)
            present(progressAlertController, animated: true, completion: nil)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if successCounter >= 3  {
            correctAnswer(successCounter: successCounter)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if successCounter >= 6{
            correctAnswer(successCounter: successCounter)
            successCounter += 1
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        }   else if successCounter >= 9 {
            correctAnswer(successCounter: successCounter)
            successCounter = 0
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
            
        } else if failureCounter > 0 && failureCounter < 3 {
            let wrongAnswerAlertController = UIAlertController(title: "Wrong!", message: "Try Again!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            wrongAnswerAlertController.addAction(okAction)
            present(wrongAnswerAlertController, animated: true, completion: nil)
            failureCounter += 1
            wrongAnswer(failureCounter: failureCounter)
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        } else if failureCounter == 3 {
            wrongAnswer(failureCounter: failureCounter)
            apiController.getTweet { (result) in
                guard let result = try? result.get() else {return}
                DispatchQueue.main.async {
                    self.tweetLabel.text = result.statuses[0].text
                }
            }
        }
        }
    
    func correctAnswer(successCounter: Int) {
        switch successCounter {
        case 1:
            break
        case 2:
            break
        case 3:
            let nextLevelAlertController = UIAlertController(title: "Congrats!", message: "Onto Level 2!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            nextLevelAlertController.addAction(okAction)
            present(nextLevelAlertController, animated: true, completion: nil)
             levelLabel.text = "Level 2"
        case 4:
            let progressAlertController = UIAlertController(title: "Correct!", message: "Keep Going", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            progressAlertController.addAction(okAction)
            present(progressAlertController, animated: true, completion: nil)
        case 5:
            let progressAlertController = UIAlertController(title: "Correct!", message: "Keep Going", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            progressAlertController.addAction(okAction)
            present(progressAlertController, animated: true, completion: nil)
        case 6:
            let nextLevelAlertController = UIAlertController(title: "Congrats!", message: "Onto Level 3!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            nextLevelAlertController.addAction(okAction)
            present(nextLevelAlertController, animated: true, completion: nil)
            levelLabel.text = "Level 3"
        case 7:
            let progressAlertController = UIAlertController(title: "Correct!", message: "Keep Going", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            progressAlertController.addAction(okAction)
            present(progressAlertController, animated: true, completion: nil)
        case 8:
            let progressAlertController = UIAlertController(title: "Correct!", message: "Keep Going", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            progressAlertController.addAction(okAction)
            present(progressAlertController, animated: true, completion: nil)
        case 9:
            let finishAlertController = UIAlertController(title: "Congrats!", message: "You Finished the Game!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            finishAlertController.addAction(okAction)
            present(finishAlertController, animated: true, completion: nil)
        default:
            break
        }
        
    }
    
    func wrongAnswer(failureCounter: Int) {
        
        switch failureCounter{
        case 0:
        rightHeart.image = UIImage(named: "Component 2")
        middleHeart.image = UIImage(named: "Component 2")
        farLeftHeart.image = UIImage(named: "Component 2")
        case 1:
            let wrongAnswerAlertController = UIAlertController(title: "Wrong!", message: "Try Again!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            wrongAnswerAlertController.addAction(okAction)
            present(wrongAnswerAlertController, animated: true, completion: nil)
            rightHeart.image = UIImage(named: "heart-outline (1)")
        case 2:
            let wrongAnswerAlertController = UIAlertController(title: "Wrong!", message: "Try Again!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            wrongAnswerAlertController.addAction(okAction)
            present(wrongAnswerAlertController, animated: true, completion: nil)
         middleHeart.image = UIImage(named: "heart-outline (1)")
        case 3:
            farLeftHeart.image = UIImage(named: "heart-outline (1)")
            let failAlertController = UIAlertController(title: "Your Out Of Lives!", message: "Try Again!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            failAlertController.addAction(okAction)
            present(failAlertController, animated: true, completion: nil)
            levelLabel.text = "Level 1"
        default:
            break
        }
    }
}

