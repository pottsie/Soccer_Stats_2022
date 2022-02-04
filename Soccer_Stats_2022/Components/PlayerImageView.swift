//
//  PlayerImageView.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 1/30/22.
//

import SwiftUI

struct PlayerImageView: View {
    let size: Int
    let image: UIImage?
    
    let defaultImage: UIImage = UIImage(named: "default-image")!
    
    var body: some View {
        Image(uiImage: image ?? defaultImage)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: CGFloat(size), height: CGFloat(size))
            .overlay(Circle().stroke(lineWidth: 3))
            .shadow(color: Color.theme.shadow.opacity(0.5), radius: 10, x: 0, y: 0)
    }
}

struct PlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerImageView(size: 200, image: UIImage(named: "default-image"))
                .previewLayout(.sizeThatFits)
                .padding()
            
            PlayerImageView(size: 200, image: UIImage(named: "default-image"))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .padding()
        }
    }
}
