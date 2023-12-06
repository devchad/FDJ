//
//  TeamsModel.swift
//  FDJ_API
//
//  Created by ghulam  on 28/08/2023.
//

struct TeamResponse: Decodable {
    let teams: [Team]
}

struct Team: Decodable, Identifiable {
    let idTeam: String?
    let strTeam: String?
    let strTeamBadge: String?
    let strLeague: String?
    let strDescriptionEN: String?
    let strCountry: String?
    var id: String? { idTeam }
}
