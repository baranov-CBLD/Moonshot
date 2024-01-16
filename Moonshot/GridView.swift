//
//  GridView.swift
//  Moonshot
//
//  Created by Kirill Baranov on 16/01/24.
//

import SwiftUI

struct GridView: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    VStack {
                        NavigationLink {
                            MissionView(mission: mission, crew: mission.filterAstronauts(astronauts))
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                
                            }
                        }
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                    
                }
                
            }
            .padding([.horizontal, .bottom])
            
        }
        
    }
}


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
    }
    
}
