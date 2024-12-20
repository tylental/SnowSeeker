//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-19.
//

import SwiftUI

struct ResortDetailsView: View {
    
    let resort: Resort
    
    
    var size: String {
        
        // returns the element of the array of the left
        // indexed by the size - 1, since size is from 1 to 3
        // i.e., size is 1, so 1 - 1 = 0, the element return will be the array at index 0
//        ["Small", "Average", "Large"][resort.size - 1]
        
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }
    
    var price: String {
        // returns the number of $ depending on the resort price
        // i.e., size = 3 so $$$
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                
                Text(size)
                    .font(.title3)
                
            }
            
            VStack {
                Text("Price")
                    .font(.caption.bold())
                
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
