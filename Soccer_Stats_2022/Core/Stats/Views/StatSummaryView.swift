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
            LazyVGrid(columns: columns, spacing: 35) {
                NavigationLink {
                    PerGameStatsView()
                } label: {
                    ScoringDataCard()
                }
                NavigationLink {
                    PerGameStatsView()
                } label: {
                    PassingDataCard()
                }

            }
            .navigationTitle("Stat Summary")
        }
    }
}

struct StatSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        StatSummaryView()
            .environmentObject(StatisticsViewModel())
    }
}
