//
//  UserController.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/26/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum NetworkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

class APIController {
    
    var presidentsNames: [String] = ["realDonaldTrump", "KamalaHarris", "CoryBooker", "JoeBiden", "marwilliamson", "AndrewYang", "ewarren", "JulianCastro","TulsiGabbard", ]
    
    var random: String?
    
    func getTweet(completion: @escaping(Result<Tweet, NetworkError>) -> Void) {
        let randomElement = "@\(String(describing: presidentsNames.randomElement()!))"
        print(randomElement)
        random = randomElement
        let requestURL = URL(string:"https://api.twitter.com/1.1/search/tweets.json?q=from:\(randomElement)&result_type=popular&count=1")!
        var request = URLRequest(url: requestURL)
        request.setValue("Bearer AAAAAAAAAAAAAAAAAAAAAJUE%2FwAAAAAASu23i0zjMuGO6PPc6%2FU4DtFIw0U%3DzWNl7fsqxDWlfRYSKJyVIGgyLbbBvNLwcwL7mN9SBQ42EhMcnK", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                completion(.failure(.otherError))
                return
            }
            guard let data = data else {
                print("Error")
                completion(.failure(.badData))
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                let tweet = try jsonDecoder.decode(Tweet.self, from: data)
                completion(.success(tweet))
            } catch {
                print("Error decoding: \(error)")
                completion(.failure(.noDecode))
            }
            }.resume()
    }
}
