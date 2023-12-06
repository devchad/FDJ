//
//  Model.swift
//  FDJ_API
//
//  Created by ghulam  on 28/08/2023.
//

struct LeagueResponse: Decodable {
    let leagues: [League]
}

struct League: Decodable, Identifiable {
    let idLeague: String
    let strLeague: String
    var id: String { idLeague }
}
