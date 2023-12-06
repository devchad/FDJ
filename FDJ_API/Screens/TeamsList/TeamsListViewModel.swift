//
//  TeamsListViewModel.swift
//  FDJ_API
//
//  Created by ghulam  on 07/09/2023.
//

import Combine
import SwiftUI

class TeamsListViewModel: ObservableObject {
    var model: TeamsListModel
    var leagueName: String
    @Published var searchText: String
    @Published var teams: [Team] = []
    
    var filtredTeams: [Team] {
        guard searchText.isEmpty == false else {
            return teams
        }
        return teams.filter { team in
            team.strTeam?.contains(searchText) == true
        }
    }
    
    init(model: TeamsListModel, leagueName: String) {
        self.model = model
        self.searchText = ""
        self.leagueName = leagueName
    }
    
    func fetchTeams() {
        Task {
            let teams = await model.fetchTeams(for: leagueName)
            await MainActor.run {
                self.teams = teams
            }
        }
    }
}
