//
//  PerGameStatsView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 2/1/22.
//

import SwiftUI

struct PerGameStatsView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    
    var body: some View {
//        NavigationView {
            ScrollView(.horizontal) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Date")
                            .frame(width: 120)
                        Text("Result")
                            .frame(width: 70)
                        Text("Min Played")
                            .frame(width: 90)
                        Text("Goals")
                            .frame(width: 70)
                        Text("Assists")
                            .frame(width: 70)
                    }
                    .font(.caption)
                    .padding(.horizontal)
                    List {
                        ForEach(gameVM.games) { game in
                            HStack {
                                Text(game.dateOfGame.formatted(date: .abbreviated, time: .omitted))
                                    .frame(width: 120, alignment: .leading)
                                Text(game.gameResult)
                                    .frame(width: 70)
                                Text("\(game.minutesPlayed) mins")
                                    .frame(width: 90)
                                Text("\(game.goals)")
                                    .frame(width: 70)
                                Text("\(game.assists)")
                                    .frame(width: 70)
                            }
                            .font(.headline)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                .padding(.top)
            }
            .navigationTitle("Per Game Scoring")
            .navigationBarTitleDisplayMode(.inline)
//        }
    }
}

struct PerGameStatsView_Previews: PreviewProvider {
    static var previews: some View {
        PerGameStatsView()
            .environmentObject(GameViewModel())
    }
}
