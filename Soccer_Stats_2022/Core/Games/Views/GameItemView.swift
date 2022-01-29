//
//  GameItemView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/29/22.
//

import SwiftUI

struct GameItemView: View {
    @EnvironmentObject private var gameVM: GameViewModel
    let game: Game
    @State var isShowcaseGame: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(game.opponent)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.theme.primaryText)
                Text(game.dateOfGame.formatted(date: .abbreviated, time: .omitted))
                    .foregroundColor(Color.theme.secondaryText)
                    .italic()
            }
            Spacer()
            if isShowcaseGame {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            Text(game.gameResult)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.primaryText)
        }
        
    }
}

struct GameItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        GameItemView(game: dev.game)
            .environmentObject(GameViewModel())
            .previewLayout(.sizeThatFits)
            
            GameItemView(game: dev.game)
                .environmentObject(GameViewModel())
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
