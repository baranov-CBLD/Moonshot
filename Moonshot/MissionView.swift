//
//  MissionView.swift
//  Moonshot
//
//  Created by Kirill Baranov on 12/01/24.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission

    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Text(mission.formattedLaunchDate)
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)

                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text(mission.description)
Divider()
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                CrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], crew: missions[0].filterAstronauts(astronauts))
        .preferredColorScheme(.dark)
}
