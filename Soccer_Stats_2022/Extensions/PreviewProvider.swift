//
//  PreviewProvider.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    // Define example PlayerProfile and Game data below
//    let player = PlayerProfile()
    //        id: UUID().uuidString,
    //        name: "Michael Potts",
    //        position: "Goalkeeper",
    //        isGoalie: false,
    //        jerseyNumber: "4",
    //        dateOfBirth: Date("2007-01-05"),
    //        ageGroup: "U-15",
    //        team: "The All-Stars",
    //        email: "pottsma@me.com",
    //        cellPhone: "571-255-0187",
    //        twitter: nil,
    //        instagram: "@mapottsie")
    
    let game = Game(
        id: UUID().uuidString,
        opponent: "LMVSC White '07B",
        dateOfGame: Date(),
        ourScore: 3,
        opponentScore: 2,
        notes: "These are notes on the game.",
        isFutsal: false,
        minutesPlayed: 75,
        goals: 1,
        assists: 2,
        shots: 2,
        shotsOnGoal: 1,
        passAttempts: 7,
        passCompletions: 6,
        blocks: 1,
        clearances: 2,
        interceptions: 3,
        goalsAllowed: 1,
        shotsFaced: 4
    )
}
