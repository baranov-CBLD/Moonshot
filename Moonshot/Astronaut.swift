//
//  Astronaut.swift
//  Moonshot
//
//  Created by Kirill Baranov on 11/01/24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
