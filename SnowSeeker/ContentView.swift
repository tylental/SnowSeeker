//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tyler Diep on 2024-12-11.
//

import SwiftUI


struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    // initializing our favorites object and then making it viewable in all views
    @State private var favorites = Favorites()
    @State private var searchText = ""
    
    // setting an initial sort order of resorts
    @State private var sortOrder = SortOrder.none
    
    var filteredResorts: [Resort] {
        
        // pass in sorted resorts first then filtering
        
        if searchText.isEmpty {
            sortedResorts
        } else {
            sortedResorts.filter { $0.name.localizedStandardContains(searchText)}
        }
    }
    
    var sortedResorts: [Resort] {
        
        // sorting the resorts depending on current sort order
        
        if sortOrder == .none {
            resorts
        } else if sortOrder == .alphabetical {
            resorts.sorted { $0.name < $1.name }
        } else {
            resorts.sorted { $0.country < $1.country }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(.rect(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .toolbar {
                // Toolbar item with a menu at the top-left
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    
                    Menu {
                        
                        // iterate through all order types and add it as an option
                        ForEach(SortOrder.allCases, id: \.self) { order in
                            Button(action: {sortOrder = order}) {
                                HStack {
                                    Text(order.rawValue)
                                    
                                    // if current option is selected, make sure it is known
                                    if sortOrder == order {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.blue)
                                    }
                                }
                            }
                        }
                        
                    } label: {
                        Image(systemName: "square.3.stack.3d.middle.filled")
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Look for a resort")
            // linking where our resort should go to
            .navigationDestination(for: Resort.self) { resort in
                    ResortView(resort: resort)
            }
            
        } detail: {
            Welcome()
        }
        // make favorites usable with pointing to the same data in all views
        .environment(favorites)
    }
    
}

#Preview {
    ContentView()
}
