//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-21.
//

import SwiftUI

// observable and as a class to make sure that we are able to modify the same data from all views
@Observable
class Favorites {
    private var resorts: Set<String>
    private let key = "Favorites"
    
    init() {
        
        if let data = UserDefaults.standard.data(forKey: key) {
            print("Data received")
            if let decoded = try? JSONDecoder().decode([String].self, from: data) {
                print("Data decoded")
                resorts = Set(decoded)
                return
            }
        }
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        
        if let encoded = try? JSONEncoder().encode(Array(resorts)) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
        
        
        
    }
}
