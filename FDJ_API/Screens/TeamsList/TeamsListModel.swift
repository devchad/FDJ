//
//  TeamsListModel.swift
//  FDJ_API
//
//  Created by ghulam  on 06/09/2023.
//

import Foundation

class TeamsListModel {
    @Published var teams: [Team] = []
    
    private var teamService: TeamServiceInterface
    
    init(teamService: TeamServiceInterface = TeamService())
    {
        self.teamService = teamService
    }
    
    func fetchTeams(for leagueName: String) async -> [Team] {
        
        do {
            return try await teamService.getTeams(for: leagueName)
        } catch(let error) {
            return []
        }
    }
}
