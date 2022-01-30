//
//  ScoringDataCard.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import SwiftUI

struct ScoringDataCard: View {
    @EnvironmentObject private var statsVM: StatisticsViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Scoring Data")
                .font(.title3)
                .fontWeight(.heavy)
            HStack {
                VStack(alignment: .leading) {
                    Text("Goals".uppercased())
                        .font(.caption)
                    Text("\(statsVM.cumulativeStats["goals"] ?? 0)")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Assists".uppercased())
                        .font(.caption)
                    Text("\(statsVM.cumulativeStats["assists"] ?? 0)")
                        .font(.title3)
                        .fontWeight(.heavy)
                }

            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Avg per Game".uppercased())
                        .font(.caption)
                    Text(statsVM.perGameAverage(for: statsVM.cumulativeStats["goals"] ?? 0))
                        .font(.title3)
                        .fontWeight(.heavy)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Avg per Game".uppercased())
                        .font(.caption)
                    Text(statsVM.perGameAverage(for: statsVM.cumulativeStats["assists"] ?? 0))
                        .font(.title3)
                        .fontWeight(.heavy)
                }
            }
            Text("Averages are normalized for 80 minute games")
                .font(.subheadline)
                .italic()
//                .foregroundColor(Color.theme.secondaryText)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.green)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

struct ScoringDataCard_Previews: PreviewProvider {
    static var previews: some View {
        ScoringDataCard()
            .environmentObject(StatisticsViewModel())
    }
}
