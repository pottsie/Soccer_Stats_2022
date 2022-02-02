//
//  GlobalConstants.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import Foundation

enum StatTypes: String, CaseIterable, Identifiable {
    
    case minutesPlayed
    case goals
    case assists
    case shots
    case shotsOnGoal
    case passAttempts
    case passCompletions
    case blocks
    case clearances
    case interceptions
    case goalsAllowed
    case shotsFaced
    
    var id: String { self.rawValue }
}
