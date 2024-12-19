//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-11.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        // using Group allows our parent view to dictate how views will be laid out for views within the Group
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Donald and Trump")
        }
        .font(.title)
    }
}

struct ContentView: View {
    // watches how our view should be handled depending on the orientation boundaries of our device
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
//        if horizontalSizeClass == .compact {
//            // syntactically different way to call our view
//                VStack(content: UserView.init)
//            } else {
//                HStack(content: UserView.init)
//            }
        
        // showing the best view that is suitable and fits the requirements of our device
        
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)
            
            Circle()
                .frame(width: 200, height: 200)
        }
        
    }
}

#Preview {
    ContentView()
}
