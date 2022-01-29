//
//  GameViewModel.swift
//  StatViewTest
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

class GameViewModel: ObservableObject {
    
    private let dataService = DataService()
    
    @Published var games: [Game]
    
    init() {
        games = dataService.games
    }
    
}
