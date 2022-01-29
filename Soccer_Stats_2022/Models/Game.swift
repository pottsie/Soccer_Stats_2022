//
//  Game.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

struct Game: Identifiable, Codable {
    
    var id: String
    var opponent: String
    var dateOfGame: Date
    var ourScore: Int
    var opponentScore: Int
    var notes: String
    var isFutsal: Bool
    
    init() {
        id = UUID().uuidString
        opponent = ""
        dateOfGame = Date()
        ourScore = 0
        opponentScore = 0
        notes = ""
        isFutsal = false

    }
    
    init(id: String, opponent: String, dateOfGame: Date, ourScore: Int, opponentScore: Int, notes: String, isFutsal: Bool) {
        self.id = id
        self.opponent = opponent
        self.dateOfGame = dateOfGame
        self.ourScore = ourScore
        self.opponentScore = opponentScore
        self.notes = notes
        self.isFutsal = isFutsal
    }

}

