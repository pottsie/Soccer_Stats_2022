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
        
        guard
            let returnedGames = LocalFileManager.instance.loadGames() else {
                self.games = []
                return
                
            }
        
        self.games = returnedGames
    }

    func saveGames(games: [Game]) {
        LocalFileManager.instance.saveGames(games: games)
    }    
}
