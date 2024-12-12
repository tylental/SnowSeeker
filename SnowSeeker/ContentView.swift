//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-11.
//

import SwiftUI

struct User: Identifiable {
    var id = "Peter Parker"
}

struct ContentView: View {
    
    // setting a user with default value of nil
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me") {
            // sets our user to a User object
            selectedUser = User()
            isShowingUser = true
        }
        
        // showing alert while unwrapping the optional
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) {}
//        }
        
        // binds selected user and opens a sheet when it is assigned
        .sheet(item: $selectedUser) { user in
            
            // our sheet closure can let us use the binded result after its been assigned
            Text(user.id)
            
            // presentation detents allows to support the sizing of our sheet
            // medium is set as the default size, which shows the sheet only taking half of the screen
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ContentView()
}
