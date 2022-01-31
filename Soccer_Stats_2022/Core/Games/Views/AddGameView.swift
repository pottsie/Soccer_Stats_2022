//
//  AddGameView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import SwiftUI

struct AddGameView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
//            Text("Add New Game")
//                .font(.largeTitle)
//                .bold()
//                .padding(.top)
            Form {
                Section {
                    TextField(text: $gameVM.newGame.opponent, prompt: Text("Opponent")) {
                        Text("Test")
                    }
                    DatePicker("Date of Game",
                               selection: $gameVM.newGame.dateOfGame,
                               in: ...Date(),
                               displayedComponents: [.date])
                    Stepper(value: $gameVM.newGame.ourScore, in: 0...25) {
                        HStack {
                            Text("Our Score")
                            Spacer()
                            Text("\(gameVM.newGame.ourScore)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.opponentScore, in: 0...25) {
                        HStack {
                            Text("Opponent Score")
                            Spacer()
                            Text("\(gameVM.newGame.opponentScore)")
                        }
                    }
                    Toggle("Futsal game?", isOn: $gameVM.newGame.isFutsal)
                    TextEditor(text: $gameVM.newGame.notes)
                        .frame(height: 100)
                } header: {
                    Text("Game Data")
                }
                Section {
                    Stepper(value: $gameVM.newGame.minutesPlayed, in: 0...80) {
                        HStack {
                            Text("Minutes Played")
                            Spacer()
                            Text("\(gameVM.newGame.minutesPlayed)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.goals, in: 0...gameVM.newGame.ourScore) {
                        HStack {
                            Text("Goals")
                            Spacer()
                            Text("\(gameVM.newGame.goals)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.assists, in: 0...(gameVM.newGame.ourScore - gameVM.newGame.goals)) {
                        HStack {
                            Text("Assists")
                            Spacer()
                            Text("\(gameVM.newGame.assists)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.shots, in: 0...25) {
                        HStack {
                            Text("Shots")
                            Spacer()
                            Text("\(gameVM.newGame.shots)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.shotsOnGoal, in: 0...gameVM.newGame.shots) {
                        HStack {
                            Text("Shots on Goal")
                            Spacer()
                            Text("\(gameVM.newGame.shotsOnGoal)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.passAttempts, in: 0...25) {
                        HStack {
                            Text("Pass Attempts")
                            Spacer()
                            Text("\(gameVM.newGame.passAttempts)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.passCompletions, in: 0...gameVM.newGame.passAttempts) {
                        HStack {
                            Text("Pass Completions")
                            Spacer()
                            Text("\(gameVM.newGame.passCompletions)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.blocks, in: 0...25) {
                        HStack {
                            Text("Blocks")
                            Spacer()
                            Text("\(gameVM.newGame.blocks)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.clearances, in: 0...25) {
                        HStack {
                            Text("Clearances")
                            Spacer()
                            Text("\(gameVM.newGame.clearances)")
                        }
                    }
                    Stepper(value: $gameVM.newGame.interceptions, in: 0...25) {
                        HStack {
                            Text("Interceptions")
                            Spacer()
                            Text("\(gameVM.newGame.interceptions)")
                        }
                    }
                } header: {
                    Text("Player Data")
                }
                Section {
                    Button {
                        gameVM.addGame()
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

struct AddGameView_Previews: PreviewProvider {
    static var previews: some View {
        AddGameView()
            .environmentObject(GameViewModel())
    }
}
