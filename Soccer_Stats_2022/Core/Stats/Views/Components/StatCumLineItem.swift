//
//  StatCumLineItem.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 2/3/22.
//

import SwiftUI

struct StatCumLineItem: View {
    @EnvironmentObject private var statsVM: StatisticsViewModel
    @EnvironmentObject private var gameVM: GameViewModel
    
    let titleLeft: String
    let statLeft: StatTypes
    let titleRight: String?
    let statRight: StatTypes?
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(titleLeft.uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("\(statsVM.cumulativeValue(for: statLeft))")
                    .font(.title3)
                    .fontWeight(.heavy)
            }
            Spacer()
            if titleRight != nil {
                VStack(alignment: .trailing) {
                    Text(titleRight!.uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                    
                    Text("\(statsVM.cumulativeValue(for: statRight!))")
                        .font(.title3)
                        .fontWeight(.heavy)
                }
            }
        }
    }
}

struct StatCumLineItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        StatCumLineItem(titleLeft: "Goals", statLeft: .goals, titleRight: "Assists", statRight: .assists)
            .environmentObject(StatisticsViewModel())
            .environmentObject(GameViewModel())
            .previewLayout(.sizeThatFits)
            
            StatCumLineItem(titleLeft: "Goals", statLeft: .goals, titleRight: "Assists", statRight: .assists)
                .environmentObject(StatisticsViewModel())
                .environmentObject(GameViewModel())
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
    }
}
