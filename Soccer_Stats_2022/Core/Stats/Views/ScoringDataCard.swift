//
//  ScoringDataCard.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import SwiftUI

struct ScoringDataCard: View {
    @EnvironmentObject private var statsVM: StatisticsViewModel
    @EnvironmentObject private var gameVM: GameViewModel
    
    func ggg() -> Int {
        return statsVM.cumulativeValue(for: .goals, in: gameVM.games)
    }

    var body: some View {
        VStack(spacing: 10) {
            Text("Scoring Data")
                .font(.title3)
                .fontWeight(.heavy)
            HStack {
                VStack(alignment: .leading) {
                    Text("Goals".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text("\(statsVM.cumulativeValue(for: .goals, in: gameVM.games))")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Assists".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text("\(statsVM.cumulativeValue(for: .assists, in: gameVM.games))")
                        .font(.title3)
                        .fontWeight(.heavy)
                }

            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Avg per Game".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text(statsVM.perGameAverage(for: .goals, in: gameVM.games).asAverageString())
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Avg per Game".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text(statsVM.perGameAverage(for: .assists, in: gameVM.games).asAverageString())
                        .font(.title3)
                        .fontWeight(.heavy)
                }
            }
            Text("Averages are normalized for 80 minute games")
                .font(.subheadline)
                .italic()
                .foregroundColor(Color.theme.secondaryText)
        }
        .foregroundColor(Color.theme.primaryText)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.theme.background)
        .cornerRadius(10)
        .shadow(color: Color.theme.shadow, radius: 10, x: 0, y: 0)
    }
}

struct ScoringDataCard_Previews: PreviewProvider {
    static var previews: some View {
        ScoringDataCard()
            .environmentObject(StatisticsViewModel())
            .environmentObject(GameViewModel())
    }
}
