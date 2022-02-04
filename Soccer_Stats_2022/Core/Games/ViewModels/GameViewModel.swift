//
//  GameViewModel.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    
    private let dataService = GameDataService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var games: [Game] = []
    @Published var newGame: Game = Game()
    @Published var numberOfGamesPlayed: Int = 0
    
    init() {
        addSubscriber()
        numberOfGamesPlayed = dataService.games.count
    }
    
    func addSubscriber() {
        dataService.$games
            .sink { [weak self] (returnedGames) in
                self?.games = returnedGames
            }
            .store(in: &cancellables)
    }
        
    // MARK: User Intents
    
    func sortGames() {
        dataService.games.sort { $0.dateOfGame < $1.dateOfGame }
    }
    
    func saveGames() {
        sortGames()
        numberOfGamesPlayed = games.count
        dataService.saveGames(games: games)
    }
    
    func deleteGame(indices: IndexSet) {
        dataService.games.remove(atOffsets: indices)
        saveGames()
    }
    
    func addGame() {
        dataService.games.append(newGame)
        resetGame()
        saveGames()
    }
    
    func resetGame() {
        newGame = Game()
    }
    
}
