//
//  HomeView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    @EnvironmentObject private var profileVM: ProfileViewModel

    
    var body: some View {
        TabView {
            GameListView()
                .tabItem {
                    Label("Game List", systemImage: "list.number")
                }
            Text("Stats View")
                .tabItem {
                    Label("Stats", systemImage: "chart.bar")
                }
            ProfileView()
                .tabItem {
                    Label("Player Profile", systemImage: "person.crop.square")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(GameViewModel())
            .environmentObject(ProfileViewModel())

    }
}
