//
//  StatisticsViewModel.swift
//  st
//
//  Created by Michael Potts on 1/28/22.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    
    private let dataService = StatisticsDataService()
    
    @Published var stats: [Statistics]
    
    init() {
        stats = dataService.stats
    }
}
