//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-19.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    
                    // checks for the best layout to use when the conditions of these sizes meet
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 10){
                            ResortDetailsView(resort: resort)
                        }
                        VStack(spacing: 10) {
                            SkiDetailsView(resort: resort)
                        }
                        
                        // otherwise, just line them up in the HStack if there is space
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    // formatting our text through array to automatically add an "and" before last element
                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ResortView(resort: .example)
}
