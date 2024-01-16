//
//  Mission.swift
//  Moonshot
//
//  Created by Kirill Baranov on 11/01/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    func filterAstronauts(_ astronauts: [String: Astronaut]) -> [CrewMember] {
        var currentCrew: [CrewMember] = self.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.name, astronaut: astronaut)
            } else {
                fatalError()
            }
        }
        return currentCrew
    }
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}
