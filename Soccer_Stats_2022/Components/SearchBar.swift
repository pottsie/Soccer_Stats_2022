//
//  SearchBar.swift
//  Soccer_Stats_2022
//
//  Created by Michael Potts on 2/4/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.theme.secondaryText :
                        Color.theme.primaryText
                )
            TextField("Type search text here...", text: $searchText)
                .foregroundColor(Color.theme.primaryText)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.primaryText)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .frame(height: 55)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.shadow.opacity(0.5),
                        radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBar(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .padding()
            SearchBar(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .padding()
        }
    }
}
