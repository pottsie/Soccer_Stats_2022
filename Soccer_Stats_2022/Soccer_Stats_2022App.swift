//
//  Soccer_Stats_2022App.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import SwiftUI

@main
struct Soccer_Stats_2022App: App {
    @StateObject private var gameVM = GameViewModel()
    @StateObject private var statsVM = StatisticsViewModel()
    
    var body: some Scene {
        WindowGroup {
            GameListView()
                .environmentObject(gameVM)
                .environmentObject(statsVM)
        }
    }
}
