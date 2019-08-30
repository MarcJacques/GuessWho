//
//  User+Convenience.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/28/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import Foundation
import CoreData

extension User {
    convenience init(id: String, email: String?, password: String?, highscore: Int16?, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.id = id
        self.email = email
        self.password = password
    }
    convenience init?(userRepresentation: UserRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        guard let email = userRepresentation.email, let password = userRepresentation.password, let highscore = userRepresentation.highScore else {return nil}
        self.init(id: userRepresentation.id, email: email, password: password, highscore: highscore)
    }
    var userRepresentation: UserRepresentation? {
        guard let id = id, let email = email, let password = password else {return nil}
        return UserRepresentation(id: id, email: email, password: password, highScore: highscore)
    }
    
    
}

