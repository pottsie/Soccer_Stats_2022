//
//  GameDataService.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

class GameDataService {
    
    @Published var games: [Game] = []
    
    init() {
        getGames()
    }
    
    private func getGames() {
        games = LocalFileManager.getGames()
    }
    
}
