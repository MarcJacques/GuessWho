//
//  ProfileViewController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/29/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet var homeButton: UIButton!
    
    @IBOutlet var pointsEarnedLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    ///do the fetching here to update name and the high score in the else in the view did load
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser?.uid == nil {
            nameLabel.text = "Guest"
            pointsEarnedLabel.text = "To Keep Track Of High Scores and Play Multiplayer Please Sign Up"
        } else {
            guard let id = Auth.auth().currentUser?.uid else {return}
            fetchUserFromPersistentStore(id: id, context: CoreDataStack.shared.mainContext)
        }
        homeButton.layer.borderWidth = 4
        homeButton.layer.cornerRadius = 10
        homeButton.layer.shadowRadius = 2
        homeButton.layer.shadowOffset = .zero
        homeButton.layer.shadowOpacity = 1
        homeButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        homeButton.layer.borderColor = AppearanceHelper.sunny.cgColor
        homeButton.backgroundColor = AppearanceHelper.bergonia
        
    }
    
    func fetchUserFromPersistentStore(id: String, context: NSManagedObjectContext) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        var result: User? = nil
        context.performAndWait {
            do {
                result = try context.fetch(fetchRequest).first
                nameLabel.text = "\(String(describing: result!.email!))"
                pointsEarnedLabel.text = "\(result!.highscore)"
            } catch {
                NSLog("Error retrieving from core data: \(error)")
            }
        }
        return result
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func homeButtonTapped(_ sender: UIButton) {
    }
}
