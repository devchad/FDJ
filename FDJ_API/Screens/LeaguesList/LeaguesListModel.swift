//
//  LeaguesListModel.swift
//  FDJ_API
//
//  Created by ghulam  on 06/09/2023.
//

import Foundation

class LeaguesListModel: ObservableObject {
    @Published var leagues: [League] = []
    
    private var leagueService: LeagueServiceInterface
    
    init(leagueService: LeagueServiceInterface = LeagueService())
    {
        self.leagueService = leagueService
    }
    
    func fetchLeagues() {
        Task {
            let leagues = await leagueService.getLeagues()
            await MainActor.run {
                self.leagues = leagues
            }
        }
    }
}
