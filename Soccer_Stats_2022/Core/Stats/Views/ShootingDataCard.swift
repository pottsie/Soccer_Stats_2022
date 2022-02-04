//
//  ShootingDataCard.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 2/2/22.
//

import SwiftUI

struct ShootingDataCard: View {
    @EnvironmentObject private var statsVM: StatisticsViewModel
    @EnvironmentObject private var gameVM: GameViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Shooting Data")
                .font(.title3)
                .fontWeight(.heavy)
            
            StatCumLineItem(titleLeft: "Shots", statLeft: .shots, titleRight: "Shots on Goal", statRight: .shotsOnGoal)

            HStack {
                VStack(alignment: .leading) {
                    Text("Avg per Game".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text(statsVM.perGameAverage(for: .shots, in: gameVM.games).asAverageString())
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Avg per Game".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text(statsVM.perGameAverage(for: .shotsOnGoal, in: gameVM.games).asAverageString())
                        .font(.title3)
                        .fontWeight(.heavy)
                }
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Shooting Efficiency".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text(statsVM.calculateEfficiency(
                        numerator: statsVM.cumulativeValue(for: .shotsOnGoal, in: gameVM.games),
                        denominator: statsVM.cumulativeValue(for: .shots, in: gameVM.games)).asPercentString())
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
//                VStack(alignment: .trailing) {
//                    Text("Avg per Game".uppercased())
//                        .font(.caption)
//                        .foregroundColor(Color.theme.secondaryText)
//
//                    Text(statsVM.perGameAverage(for: .passCompletions, in: gameVM.games).asAverageString())
//                        .font(.title3)
//                        .fontWeight(.heavy)
//                }
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
        .shadow(color: Color.theme.shadow.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

struct ShootingDataCard_Previews: PreviewProvider {
    static var previews: some View {
        ShootingDataCard()
            .environmentObject(StatisticsViewModel())
            .environmentObject(GameViewModel())
    }
}
