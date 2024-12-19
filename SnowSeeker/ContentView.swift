//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-11.
//

import SwiftUI


struct ContentView: View {
    @State private var searchText = ""
    
    let allNames = ["Tyler", "Peter", "Iron Man", "Joey"]
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        }
        else {
            allNames.filter { name in
                
                // best way to find a substring of another string and ignores case by default
                name.localizedStandardContains(searchText)
            }
        }
    }
    
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")

        }
        
    }
}

#Preview {
    ContentView()
}
