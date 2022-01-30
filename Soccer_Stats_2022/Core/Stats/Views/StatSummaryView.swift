//
//  StatSummaryView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import SwiftUI

struct StatSummaryView: View {
    @EnvironmentObject private var statsVM: StatisticsViewModel
    
    let columns: [GridItem] = [
        GridItem(.fixed(350), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 25) {
                ScoringDataCard()
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
