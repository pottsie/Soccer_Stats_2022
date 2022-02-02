//
//  StatisticsViewModel.swift
//  st
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation
import SwiftUI

class StatisticsViewModel: ObservableObject {
    
    @Published var numberOfGame: Int
    
    init() {
        
        numberOfGame = 0
        
    }
    
    private func numberOfGamesPlayed(games: [Game]) -> Int {
        return games.count
    }
    
    func cumulativeValue(for stat: StatTypes, in games: [Game]) -> Int {
        var totalValue = 0
        for game in games {
            switch stat {
            case .minutesPlayed:
                totalValue += game.minutesPlayed
            case .goals:
                totalValue += game.goals
            case .assists:
                totalValue += game.assists
            case .shots:
                totalValue += game.shots
            case .shotsOnGoal:
                totalValue += game.shotsOnGoal
            case .passAttempts:
                totalValue += game.passAttempts
            case .passCompletions:
                totalValue += game.passCompletions
            case .blocks:
                totalValue += game.blocks
            case .clearances:
                totalValue += game.clearances
            case .interceptions:
                totalValue += game.interceptions
            case .goalsAllowed:
                totalValue += game.goalsAllowed
            case .shotsFaced:
                totalValue += game.shotsFaced
            }
        }
        return totalValue
    }
    
    func perGameAverage(for stat: StatTypes, in games: [Game]) -> Double {
        if numberOfGamesPlayed(games: games) == 0 {
            return 0.0
        } else {
            return Double(cumulativeValue(for: stat, in: games)) / Double(cumulativeValue(for: .minutesPlayed, in: games)) * 80.0
        }
    }

    
//    private let dataService = GameDataService()
//
//    @Published var cumulativeStats: [String: Int] = [
//        "minutesPlayed": 0,
//        "goals": 0,
//        "assists": 0,
//        "shots": 0,
//        "shotsOnGoal": 0,
//        "passAttempts": 0,
//        "passCompletions": 0,
//        "blocks": 0,
//        "clearances": 0,
//        "interceptions": 0,
//        "goalsAllowed": 0,
//        "shotsFaced": 0
//    ]
//    @Published var numberOfGamesPlayed: Int
//    let games: [Game]
//
//    init() {
//        games = dataService.games
//        numberOfGamesPlayed = games.count
////        cumulativeStats = [0,0,0,0,0,0,0,0,0,0,0,0]
//        for game in games {
//            cumulativeStats["minutesPlayed"]! += game.minutesPlayed
//            cumulativeStats["goals"]! += game.goals
//            cumulativeStats["assists"]! += game.assists
//            cumulativeStats["shots"]! += game.shots
//            cumulativeStats["shotsOnGoal"]! += game.shotsOnGoal
//            cumulativeStats["passAttempts"]! += game.passAttempts
//            cumulativeStats["passCompletions"]! += game.passCompletions
//            cumulativeStats["blocks"]! += game.blocks
//            cumulativeStats["clearances"]! += game.clearances
//            cumulativeStats["interceptions"]! += game.interceptions
//            cumulativeStats["goalsAllowed"]! += game.goalsAllowed
//            cumulativeStats["shotsFaced"]! += game.shotsFaced
//        }
//    }
    
    
    
}
