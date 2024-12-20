//
//  Resort.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-19.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    // static variables are lazy loaded, forcing SwiftUI to load them only when they are called
    // this makes sure that allResorts will always be called before example
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
}

