//
//  TeamsListModel.swift
//  FDJ_API
//
//  Created by ghulam  on 11/09/2023.
//

import Foundation

class TeamsDetailModel {
    var team: Team
    var leagueName: String
    
    init(team: Team, leagueName: String) {
        self.team = team
        self.leagueName = leagueName
    }
}
