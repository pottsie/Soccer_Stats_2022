//
//  GameDetailView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import SwiftUI

struct GameDetailView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    @State var isEditingGame: Bool = false
    @State var game: Game
    @State var isGoalie: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                
                gameInformation
                StatSectionView(header1: "Minutes Played", stat1: game.minutesPlayed, header2: nil, stat2: nil, header3: nil, stat3: nil)
                StatSectionView(header1: "Goals", stat1: game.goals, header2: "Assists", stat2: game.assists, header3: nil, stat3: nil)
                StatSectionView(header1: "Shots", stat1: game.shots, header2: "SoG", stat2: game.shotsOnGoal, header3: "Shooting %", stat3: game.shootingPercentage)
                StatSectionView(header1: "Pass Att", stat1: game.passAttempts, header2: "Pass Comp", stat2: game.passCompletions, header3: "Passing %", stat3: game.passingPercentage)
                StatSectionView(header1: "Blocks", stat1: game.blocks, header2: "Clearances", stat2: game.clearances, header3: "Intercepts", stat3: game.interceptions)
//                StatSectionView(header1: "Interceptions", stat1: game.interceptions, header2: nil, stat2: nil)
                
                if isGoalie {
                    StatSectionView(header1: "Shots Faced", stat1: game.shotsFaced, header2: "Saves", stat2: game.saves, header3: "Save %", stat3: game.savePercentage)
                }
                
                gameNotes
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        print("Editing Game")
//                        isEditingGame.toggle()
//                    } label: {
//                        Label("Edit Gamme", systemImage: "pencil")
//                    }
//                }
            }
//            .fullScreenCover(isPresented: $isEditingGame) {
//                let index = gameVM.findIndexOfGame(gameID: game.id)
//                EditGame(game: $gameVM.games[index])
//            }
        }
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameDetailView(game: dev.game)
                .environmentObject(GameViewModel())
        }
    }
}

extension GameDetailView {
    
    var gameInformation: some View {
        Group {
            VStack(alignment: .leading) {
                Text("Opponent".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text(game.opponent)
                    .font(.title2)
                    .foregroundColor(Color.theme.primaryText)
                    .fontWeight(.black)
            }
            VStack(alignment: .leading) {
                Text("Result".uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                Text(game.gameResult)
                    .font(.title3)
                    .foregroundColor(Color.theme.primaryText)
                    .fontWeight(.black)
            }
        }
        .frame(width: 350, alignment: .leading)
    }
    
    var gameNotes: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Game Notes".uppercased())
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(game.notes)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .padding(7)
                .frame(height: 150, alignment: .topLeading)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

    }
}
