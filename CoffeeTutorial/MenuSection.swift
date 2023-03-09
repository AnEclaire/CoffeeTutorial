//
//  MenuSection.swift
//  CoffeeTutorial
//
//  Created by Emma Gutierrez on 3/8/23.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
}
