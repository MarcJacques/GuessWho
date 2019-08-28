//
//  Tweet.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/27/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import Foundation

struct Tweet: Codable {
    var statuses: [StatusInfo]
}

struct StatusInfo: Codable {
    var text: String
}
