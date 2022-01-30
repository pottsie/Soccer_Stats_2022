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

    // TODO: Mark a game as a showcase or highlight, then you the list can be searched
    
    // MARK: Initializers
    init() {
        id = UUID().uuidString
        opponent = ""
        dateOfGame = Date()
        ourScore = 0
        opponentScore = 0
        notes = ""
        isFutsal = false
        minutesPlayed = 0
        goals = 0
        assists = 0
        shots = 0
        shotsOnGoal = 0
        passAttempts = 0
        passCompletions = 0
        blocks = 0
        clearances = 0
        interceptions = 0
        goalsAllowed = 0
        shotsFaced = 0
    }
    
    init(id: String, opponent: String, dateOfGame: Date, ourScore: Int, opponentScore: Int, notes: String, isFutsal: Bool, minutesPlayed: Int, goals: Int, assists: Int, shots: Int, shotsOnGoal: Int, passAttempts: Int, passCompletions: Int, blocks: Int, clearances: Int, interceptions: Int, goalsAllowed: Int, shotsFaced: Int) {
        
        self.id = id
        self.opponent = opponent
        self.dateOfGame = dateOfGame
        self.ourScore = ourScore
        self.opponentScore = opponentScore
        self.notes = notes
        self.isFutsal = isFutsal
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
    
    var gameResult: String {
        if ourScore > opponentScore {
            return "W \(ourScore)-\(opponentScore)"
        } else if ourScore < opponentScore {
            return "L \(ourScore)-\(opponentScore)"
        } else {
            return "T \(ourScore)-\(opponentScore)"
        }
    }
    
    var passPercentage: String {
        return "\((Double(passCompletions) / Double(passAttempts)).formatted(.percent))"
    }
}

