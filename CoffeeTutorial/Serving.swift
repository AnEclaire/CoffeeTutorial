//
//  Serving.swift
//  CoffeeTutorial
//
//  Created by Emma Gutierrez on 3/9/23.
//

import Foundation

struct Serving: Identifiable, Codable {
    var id: UUID
    let name: String
    let descrtiption: String
    let caffeine: Int
    let calories: Int
}
