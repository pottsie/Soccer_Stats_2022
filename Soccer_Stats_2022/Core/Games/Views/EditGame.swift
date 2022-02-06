//
//  EditGame.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 2/5/22.
//

import SwiftUI

struct EditGame: View {
    @Binding var game: Game
    @EnvironmentObject private var gameVM: GameViewModel
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(text: $game.opponent, prompt: Text("Opponent")) {
                        Text("Test")
                    }
                    DatePicker("Date of Game",
                               selection: $game.dateOfGame,
                               in: ...Date(),
                               displayedComponents: [.date])
                    Stepper(value: $game.ourScore, in: 0...25) {
                        HStack {
                            Text("Our Score")
                            Spacer()
                            Text("\(game.ourScore)")
                        }
                    }
                    Stepper(value: $game.opponentScore, in: 0...25) {
                        HStack {
                            Text("Opponent Score")
                            Spacer()
                            Text("\(game.opponentScore)")
                        }
                    }
                    Picker(selection: $game.gameType) {
                        Text("Outdoor").tag(GameType.Outdoor)
                        Text("Futsal").tag(GameType.Futsal)
                    } label: {
                        Text("Game Type")
                    }
                    .pickerStyle(.segmented)
                    Stepper(value: $game.gameLength, in: 40...90, step: 10) {
                        HStack {
                            Text("Game Length")
                            Spacer()
                            Text("\(game.gameLength)")
                        }
                    }
//                    Toggle("Futsal game?", isOn: $gameVM.newGame.isFutsal)
                    TextEditor(text: $game.notes)
                        .frame(height: 100)
                } header: {
                    Text("Game Data")
                }
                Section {
                    Stepper(value: $game.minutesPlayed, in: 0...80) {
                        HStack {
                            Text("Minutes Played")
                            Spacer()
                            Text("\(game.minutesPlayed)")
                        }
                    }
                    Stepper(value: $game.goals, in: 0...game.ourScore) {
                        HStack {
                            Text("Goals")
                            Spacer()
                            Text("\(game.goals)")
                        }
                    }
                    Stepper(value: $game.assists, in: 0...(game.ourScore - game.goals)) {
                        HStack {
                            Text("Assists")
                            Spacer()
                            Text("\(game.assists)")
                        }
                    }
                    Stepper(value: $game.shots, in: 0...25) {
                        HStack {
                            Text("Shots")
                            Spacer()
                            Text("\(game.shots)")
                        }
                    }
                    Stepper(value: $game.shotsOnGoal, in: 0...game.shots) {
                        HStack {
                            Text("Shots on Goal")
                            Spacer()
                            Text("\(game.shotsOnGoal)")
                        }
                    }
                    Stepper(value: $game.passAttempts, in: 0...25) {
                        HStack {
                            Text("Pass Attempts")
                            Spacer()
                            Text("\(game.passAttempts)")
                        }
                    }
                    Stepper(value: $game.passCompletions, in: 0...game.passAttempts) {
                        HStack {
                            Text("Pass Completions")
                            Spacer()
                            Text("\(game.passCompletions)")
                        }
                    }
                    Stepper(value: $game.blocks, in: 0...25) {
                        HStack {
                            Text("Blocks")
                            Spacer()
                            Text("\(game.blocks)")
                        }
                    }
                    Stepper(value: $game.clearances, in: 0...25) {
                        HStack {
                            Text("Clearances")
                            Spacer()
                            Text("\(gameVM.newGame.clearances)")
                        }
                    }
                    Stepper(value: $game.interceptions, in: 0...25) {
                        HStack {
                            Text("Interceptions")
                            Spacer()
                            Text("\(game.interceptions)")
                        }
                    }
                } header: {
                    Text("Player Data")
                }
                Section {
                    Button {
//                        print(gameVM.games[index].opponent)
                        
//                        gameVM.saveGames()
                        dismiss()
                    } label: {
                        Text("Save Game")
                    }
                    Button(role: .destructive) {
                        dismiss()
                    } label: {
                        Text("Cancel and Discard Data")
                    }
                }
            }
        }
    }
}

struct EditGame_Previews: PreviewProvider {
    static var previews: some View {
        EditGame(game: .constant(Game()))
            .environmentObject(GameViewModel())
    }
}
