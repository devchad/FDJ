//
//  LeaguesDetailView.swift
//  FDJ_API
//
//  Created by ghulam  on 28/08/2023.
import SwiftUI

struct TeamsDetailView: View {
    @ObservedObject var viewModel: TeamsDetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.strCount)
            Text(viewModel.strLeag)
            Text("Description: \(viewModel.teamDescription)")
        }
        .navigationTitle(viewModel.teamName)
    }
}
