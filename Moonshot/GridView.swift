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
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

//    let columns = [
//        GridItem(.adaptive(minimum: 150))
//    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    VStack {
                        
//                        NavigationLink {
//                            MissionView(mission: mission, crew: mission.filterAstronauts(astronauts))
//                        } label: {
                        
                        NavigationLink(value: mission) {

                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
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
                .navigationDestination(for: Mission.self) { mission in
                    MissionView(mission: mission, crew: mission.filterAstronauts(astronauts))
                }
                
            }
            .padding([.horizontal, .bottom])
            
        }
        
    }
}


