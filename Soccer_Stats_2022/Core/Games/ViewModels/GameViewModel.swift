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
    
    init() {
        games = dataService.games
    }
        
    // MARK: User Intents
    
    func sortGames() {
        games.sort { $0.dateOfGame < $1.dateOfGame }
    }
    
    func saveGames() {
        sortGames()
        // code for saving the games (link to GameDataService)
    }
    
    func deleteGame(indices: IndexSet) {
        games.remove(atOffsets: indices)
    }
    
    func addGame() {
        games.append(newGame)
        resetGame()
        sortGames()
        saveGames()
    }
    
    func resetGame() {
        newGame = Game()
    }
    
}
