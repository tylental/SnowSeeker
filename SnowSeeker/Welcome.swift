//
//  Welcome.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-19.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            Text("Please select a resort from the left-hand menu; swipe from the edge to show it")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    Welcome()
}
