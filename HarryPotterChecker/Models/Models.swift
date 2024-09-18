//
//  Models.swift
//  HarryPotterChecker
//
//  Created by Hanna Che on 17/09/2024.
//

import Foundation

struct Spells: Identifiable, Codable {
    var id: Int {
        self.index
    }
    
    let spell, use: String
    let index: Int
}

struct Books: Identifiable, Codable {
    var id: Int {
        self.index
    }
    
    let number: Int
    let title, originalTitle, releaseDate, description: String
    let pages: Int
    let cover: String
    let index: Int
}

struct Characters: Identifiable, Codable {
    var id: Int {
        self.index
    }
    
    let fullName, nickname: String
    let hogwartsHouse: HogwartsHouse
    let interpretedBy: String
    let children: [String]
    let image: String
    let birthdate: String
    let index: Int
}

enum HogwartsHouse: String, Codable {
    case gryffindor = "Gryffindor"
    case hufflepuff = "Hufflepuff"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
}

struct Houses: Identifiable, Codable {
    var id: Int {
        self.index
    }
    
    let house, emoji, founder: String
    let colors: [String]
    let animal: String
    let index: Int
}
