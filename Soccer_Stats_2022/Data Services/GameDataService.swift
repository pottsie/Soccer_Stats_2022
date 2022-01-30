//
//  GameDataService.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

class GameDataService {
    
    @Published var games: [Game]
    
    init() {
        if LocalFileManager.instance.loadGames() == nil {
            print("INITIALIZING NEW ARRAY")
            self.games = []
        } else {
            print("LOADING GAMES FROM FILE")
            self.games = LocalFileManager.instance.loadGames()!
        }
    }

    func saveGames(games: [Game]) {
        LocalFileManager.instance.saveGames(games: games)
    }

    private func json() throws -> Data {
        return try JSONEncoder().encode(games)
    }
}
