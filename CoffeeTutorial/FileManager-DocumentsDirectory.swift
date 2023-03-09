//
//  FileManager-DocumentsDirectory.swift
//  CoffeeTutorial
//
//  Created by Emma Gutierrez on 3/9/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
