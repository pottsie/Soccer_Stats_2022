//
//  GameListView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    
    @State private var showNewGameSheet: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $gameVM.searchText)
                List {
                    ForEach(gameVM.games) { game in
                        NavigationLink {
                            GameDetailView(game: game)
                        } label: {
                            GameItemView(game: game)
                        }
                    }
                    .onDelete(perform: gameVM.deleteGame)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Games")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showNewGameSheet.toggle()
                        } label: {
                            Label("Add game", systemImage: "plus.circle")
                        }
                    }
                }
                .fullScreenCover(isPresented: $showNewGameSheet) {
                    AddGameView()
            }
            }
            // TODO: Implement search for the list of games
//            .searchable(text: $searchText)
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
            .environmentObject(GameViewModel())
    }
}
