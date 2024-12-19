//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-11.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    // this reads the object out from the environment
    @Environment(Player.self) var player
    
    var body: some View {
        // make a local copy of the player object to be usable
        
    
        @Bindable var player = player
        Stepper("High score: \(player.highScore)", value: $player.highScore)
    }
}

struct ContentView: View {
    @State private var player = Player()
    
    var body: some View {
        VStack  {
            Text("Welcome!")
            HighScoreView()
        }
        
        // designed for Observable objects and any subview can use this player object
        .environment(player)
    }
}

#Preview {
    ContentView()
}
