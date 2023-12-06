//
//  TeamDetailView.swift
//  FDJ_API
//
//  Created by ghulam  on 29/08/2023.
//

import SwiftUI

struct TeamsListView: View {
    @ObservedObject var viewModel: TeamsListViewModel
    let teamName: String
    
    var body: some View {
            List(viewModel.teams) { team in
                NavigationLink(
                    destination: TeamsDetailView(
                        viewModel: TeamsDetailViewModel(
                            model: TeamsDetailModel(
                                team: team,
                                leagueName: viewModel.leagueName
                            )
                        )
                    )
                ) {
                    HStack {
                        AsyncImage(url: team.strTeamBadge ?? "")
                            
                            .frame(width: 40, height: 40)
                            .cornerRadius(20)
                        Text(team.strTeam ?? "")
                    }
                }
            }
            .onAppear {
                viewModel.fetchTeams()
            }
            .navigationTitle(viewModel.leagueName)
        }
}
