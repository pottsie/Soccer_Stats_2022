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
                            .frame(width: 120, alignment: .leading)
                        Text("Result")
                            .frame(width: 70, alignment: .center)
                        Text("Mins Played")
                            .frame(width: 70, alignment: .center)
                        Text("Goals")
                            .frame(width: 50, alignment: .center)
                        Text("Assists")
                            .frame(width: 50, alignment: .center)
                    }
                    .font(.caption)
                    .padding(.horizontal)
                    List {
                        ForEach(gameVM.games) { game in
                            HStack {
                                Text(game.dateOfGame.formatted(date: .abbreviated, time: .omitted))
                                    .frame(width: 120, alignment: .leading)
                                Text(game.gameResult)
                                    .frame(width: 70, alignment: .center)
                                Text("\(game.minutesPlayed) mins")
                                    .frame(width: 70, alignment: .center)
                                Text("\(game.goals)")
                                    .frame(width: 50, alignment: .center)
                                Text("\(game.assists)")
                                    .frame(width: 50, alignment: .center)
                            }
                            .font(.headline)
                            .padding(.horizontal, 0)
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
