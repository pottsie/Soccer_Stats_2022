//
//  GameDetailView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import SwiftUI

struct GameDetailView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    
    @State var game: Game
    @State var isGoalie: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                
                gameInformation
                StatSectionView(header1: "Minutes Played", stat1: game.minutesPlayed, header2: nil, stat2: nil)
                StatSectionView(header1: "Goals", stat1: game.goals, header2: "Assists", stat2: game.assists)
                StatSectionView(header1: "Shots", stat1: game.shots, header2: "Shots on Goal", stat2: game.shotsOnGoal)
                StatSectionView(header1: "Pass Att", stat1: game.passAttempts, header2: "Pass Comp", stat2: game.passCompletions)
                StatSectionView(header1: "Blocks", stat1: game.blocks, header2: "Clearances", stat2: game.clearances)
                StatSectionView(header1: "Interceptions", stat1: game.interceptions, header2: nil, stat2: nil)
                
                if isGoalie {
                    StatSectionView(header1: "Shots Faced", stat1: game.shotsFaced, header2: "Goals Allowed", stat2: game.goalsAllowed)
                }
                
                gameNotes
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                }
            }
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
                .frame(height: 100, alignment: .topLeading)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

    }
}
