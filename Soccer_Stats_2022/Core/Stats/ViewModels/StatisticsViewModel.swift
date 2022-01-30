//
//  StatisticsViewModel.swift
//  st
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    
    private let dataService = GameDataService()
    
    @Published var cumulativeStats: [String: Int] = [
        "minutesPlayed": 0,
        "goals": 0,
        "assists": 0,
        "shots": 0,
        "shotsOnGoal": 0,
        "passAttempts": 0,
        "passCompletions": 0,
        "blocks": 0,
        "clearances": 0,
        "interceptions": 0,
        "goalsAllowed": 0,
        "shotsFaced": 0
    ]
    @Published var numberOfGamesPlayed: Int
    let games: [Game]
    
    init() {
        games = dataService.games
        numberOfGamesPlayed = games.count
//        cumulativeStats = [0,0,0,0,0,0,0,0,0,0,0,0]
        for game in games {
            cumulativeStats["minutesPlayed"]! += game.minutesPlayed
            cumulativeStats["goals"]! += game.goals
            cumulativeStats["assists"]! += game.assists
            cumulativeStats["shots"]! += game.shots
            cumulativeStats["shotsOnGoal"]! += game.shotsOnGoal
            cumulativeStats["passAttempts"]! += game.passAttempts
            cumulativeStats["passCompletions"]! += game.passCompletions
            cumulativeStats["blocks"]! += game.blocks
            cumulativeStats["clearances"]! += game.clearances
            cumulativeStats["interceptions"]! += game.interceptions
            cumulativeStats["goalsAllowed"]! += game.goalsAllowed
            cumulativeStats["shotsFaced"]! += game.shotsFaced
        }
    }
    
    func perGameAverage(for stat: Int) -> String {
        if numberOfGamesPlayed == 0 {
            return "0.0"
        } else {
            return "\(Double(stat) / Double(cumulativeStats["minutesPlayed"] ?? 0) * 80.0)"
        }
    }
}
