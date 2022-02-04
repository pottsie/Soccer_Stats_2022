//
//  GameDataCard.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 2/2/22.
//

import SwiftUI

struct GameDataCard: View {
    @EnvironmentObject private var statsVM: StatisticsViewModel
    @EnvironmentObject private var gameVM: GameViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Game Data")
                .font(.title3)
                .fontWeight(.heavy)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Minutes Played".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text("\(statsVM.cumulativeValue(for: .minutesPlayed))")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Games Played".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text("\(gameVM.numberOfGamesPlayed)")
                        .font(.title3)
                        .fontWeight(.heavy)
                }

            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Avg per Game".uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)

                    Text("\(statsVM.cumulativeValue(for: .minutesPlayed) / gameVM.numberOfGamesPlayed)")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
            }
        }
        .foregroundColor(Color.theme.primaryText)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.theme.background)
        .cornerRadius(10)
        .shadow(color: Color.theme.shadow.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

struct GameDataCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        GameDataCard()
            .environmentObject(StatisticsViewModel())
            .environmentObject(GameViewModel())
            .previewLayout(.sizeThatFits)
            
            GameDataCard()
                .environmentObject(StatisticsViewModel())
                .environmentObject(GameViewModel())
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
