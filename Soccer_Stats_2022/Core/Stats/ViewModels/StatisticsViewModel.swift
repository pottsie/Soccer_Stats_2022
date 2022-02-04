//
//  StatisticsViewModel.swift
//  st
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation
import SwiftUI
import Combine

class StatisticsViewModel: ObservableObject {
    
    @Published var numberOfGamesPlayed: Int = 0
    
    var games: [Game] = []
    private var cancellables = Set<AnyCancellable>()
    private let dataService = GameDataService.shared
    
    init() {
        getSubscriptions()
        computeNumberOfGamesPlayed()
    }
    
    func getSubscriptions() {
        dataService.$games
            .sink { [weak self] (returnedGames) in
                self?.games = returnedGames
            }
            .store(in: &cancellables)
    }
    
    func computeNumberOfGamesPlayed() {
        numberOfGamesPlayed = games.count
    }
    
    func cumulativeValue(for stat: StatTypes) -> Int {
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
        if numberOfGamesPlayed == 0 {
            return 0.0
        } else {
            return Double(cumulativeValue(for: stat)) / Double(cumulativeValue(for: .minutesPlayed)) * 80.0
        }
    }
    
    func calculateEfficiency(numerator: Int, denominator: Int) -> Double {
        if denominator != 0 {
            return Double(numerator) / Double(denominator)
        } else {
            return 0.0
        }
    }
}
