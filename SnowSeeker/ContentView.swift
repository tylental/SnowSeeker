//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // SwiftUI will differ automatically show different views on different devices
            NavigationSplitView(preferredCompactColumn: .constant(.detail)){
                // tapping on the link will display over the secondary/detail view
                NavigationLink("Primary"){
                    Text("New View")
                }
            } detail: {
                Text("Content")
            }
            // show our views within the split view as equal portions of each other, if the view is permissible
            .navigationSplitViewStyle(.balanced)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
