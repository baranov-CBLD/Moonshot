//
//  ContentView.swift
//  Moonshot
//
//  Created by Kirill Baranov on 10/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGrid = true
    
    
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            VStack {
                if isGrid {
                    GridView(astronauts: astronauts, missions: missions)
                } else {
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button(isGrid ? "List" : "Grid") {
                        isGrid.toggle()
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}




