//
//  StatSummaryView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import SwiftUI

struct StatSummaryView: View {
    @EnvironmentObject private var statsVM: StatisticsViewModel
//    @State var showScoringData: Bool = false
    
    let columns: [GridItem] = [
        GridItem(.fixed(350), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        NavigationView {
            if !statsVM.games.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 40) {
//                        NavigationLink {
//                            PerGameStatsView()
//                        } label: {
                            GameDataCard()
//                        }
                        NavigationLink {
                            PerGameStatsView()
                        } label: {
                            ScoringDataCard()
                        }
                        NavigationLink {
                            PerGameStatsView()
                        } label: {
                            ShootingDataCard()
                        }
                        NavigationLink {
                            PerGameStatsView()
                        } label: {
                            PassingDataCard()
                        }
                    }
                    .navigationTitle("Stat Summary")
                }
            } else {
                VStack {
                    Text("No Game Data")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.theme.primaryText)
                        .padding()
                    Text("Add a game to see your statistical data.")
                        .font(.title3)
                        .foregroundColor(Color.theme.secondaryText)
                    Spacer()
                }
            }
        }
    }
}

struct StatSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        StatSummaryView()
            .environmentObject(StatisticsViewModel())
    }
}
