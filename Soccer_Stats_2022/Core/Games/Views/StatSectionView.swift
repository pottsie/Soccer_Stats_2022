//
//  StatSectionView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import SwiftUI

struct StatSectionView: View {
    let header1: String?
    let stat1: Int?
    let header2: String?
    let stat2: Int?
    let header3: String?
    let stat3: Int?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if header1 != nil {
                    Text(header1!.uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                    Text("\(stat1!)")
                        .font(.title3)
                        .foregroundColor(Color.theme.primaryText)
                        .fontWeight(.heavy)
                }
            }
            .frame(width: 100, alignment: .leading)
            
            Spacer()
            
            VStack {
                if header2 != nil {
                    Text(header2!.uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                        .multilineTextAlignment(.center)
                    Text("\(stat2!)")
                        .font(.title3)
                        .foregroundColor(Color.theme.primaryText)
                        .fontWeight(.heavy)
                    
                }
            }
            .frame(width: 100)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                if header3 != nil {
                    Text(header3!.uppercased())
                        .font(.caption)
                        .foregroundColor(Color.theme.secondaryText)
                        .multilineTextAlignment(.trailing)
                    Text("\(stat3!)")
                        .font(.title3)
                        .foregroundColor(Color.theme.primaryText)
                        .fontWeight(.heavy)
                }
            }
            .frame(width: 100, alignment: .trailing)
            
        }
        .frame(width: 350)
    }
}

struct StatSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        StatSectionView(header1: "Shots", stat1: 3, header2: "Shots on Goal", stat2: 1, header3: "Shooting %", stat3: 33)
            .previewLayout(.sizeThatFits)
            
            StatSectionView(header1: "Goals", stat1: 1, header2: "Assists", stat2: 3, header3: nil, stat3: nil)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            StatSectionView(header1: "Shots", stat1: 1, header2: nil, stat2: nil, header3: nil, stat3: nil)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
