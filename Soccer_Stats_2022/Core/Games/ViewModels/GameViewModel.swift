//
//  GameViewModel.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

class GameViewModel: ObservableObject {
    
    private let dataService = GameDataService()
    
    @Published var games: [Game]
    @Published var newGame: Game = Game()
    @Published var numberOfGamesPlayed: Int
    
    init() {
        games = dataService.games
        numberOfGamesPlayed = dataService.games.count
    }
        
    // MARK: User Intents
    
    func sortGames() {
        games.sort { $0.dateOfGame < $1.dateOfGame }
    }
    
    func saveGames() {
        sortGames()
        numberOfGamesPlayed = games.count
        dataService.saveGames(games: games)
    }
    
    func deleteGame(indices: IndexSet) {
        games.remove(atOffsets: indices)
        saveGames()
    }
    
    func addGame() {
        games.append(newGame)
        resetGame()
        saveGames()
    }
    
    func resetGame() {
        newGame = Game()
    }
    
}
