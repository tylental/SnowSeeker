//
//  Facility.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-21.
//

import SwiftUI

struct Facility: Identifiable {
    
    // creating a facility struct for each facility
    
    let id = UUID()
    var name: String
    
    private let icons = [
        "Accommodation": "house",
        "Beginners": "1.circle",
        "Cross-country": "map",
        "Eco-friendly": "leaf.arrow.circlepath",
        "Family": "person.3"
    ]
    
    private let descriptions = [
        "Accommodation": "This resort has popular on-site accommodation.",
        "Beginners": "This resort has a lot of ski schools",
        "Cross-country": "This resort has many cross-country ski routes.",
        "Eco-friendly": "This resort is environmentally friendly.",
        "Family": "This resort is popular for families."
    ]
    
    var icon: some View {
        // matching the icon with facility name
        // returns a view
        if let iconName = icons[name] {
            Image(systemName: iconName)
                .accessibilityLabel(name)
                .foregroundStyle(.secondary)
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }
    
    var description: String {
        if let message = descriptions[name] {
            message
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }
}
