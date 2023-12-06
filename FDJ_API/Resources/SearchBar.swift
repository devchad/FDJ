//
//  SearchBar.swift
//  FDJ_API
//
//  Created by ghulam  on 03/09/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Rechercher...", text: $searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 15)

            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText.isEmpty ? 0 : 1)
            }
            .padding(.trailing, 8)
            .foregroundColor(.gray)
        }
    }
}

