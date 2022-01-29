//
//  Statistics.swift
//  st
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

struct Statistics: Identifiable, Codable {
    
    var id: String
    var minutesPlayed: Int
    var goals: Int
    var assists: Int
    var shots: Int
    var shotsOnGoal: Int
    var passAttempts: Int
    var passCompletions: Int
    var blocks: Int
    var clearances: Int
    var interceptions: Int
    var goalsAllowed: Int
    var shotsFaced: Int
    
    init(id: String, minutesPlayed: Int, goals: Int, assists: Int, shots: Int, shotsOnGoal: Int, passAttempts: Int, passCompletions: Int, blocks: Int, clearances: Int, interceptions: Int, goalsAllowed: Int, shotsFaced: Int) {
        self.id = id
        self.minutesPlayed = minutesPlayed
        self.goals = goals
        self.assists = assists
        self.shots = shots
        self.shotsOnGoal = shotsOnGoal
        self.passAttempts = passAttempts
        self.passCompletions = passCompletions
        self.blocks = blocks
        self.clearances = clearances
        self.interceptions = interceptions
        self.goalsAllowed = goalsAllowed
        self.shotsFaced = shotsFaced

    }

}
