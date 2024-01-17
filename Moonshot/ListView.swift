//
//  ListView.swift
//  Moonshot
//
//  Created by Kirill Baranov on 16/01/24.
//

import SwiftUI

struct ListView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, crew: mission.filterAstronauts(astronauts))
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                    HStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
//        .listStyle(.plain)
        .listRowBackground(Color.lightBackground)
    }
    
}
