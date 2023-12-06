//
//  LeagueTeam.swift
//  FDJ_API
//
//  Created by ghulam  on 06/09/2023.
//

import SwiftUI

protocol TeamServiceInterface {
    func getTeams(for teamName: String) async throws -> [Team]
}

class TeamService: TeamServiceInterface {
    func getTeams(for teamName: String) async throws -> [Team] {
        guard let encodedLeagueName = teamName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/search_all_teams.php?l=\(encodedLeagueName)") else {
            return []
        }

        do {
            return try await withCheckedThrowingContinuation { continuation in
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let decodedResponse = try JSONDecoder().decode(TeamResponse.self, from: data)
                            continuation.resume(returning: decodedResponse.teams)
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    }
                }.resume()
            }
        } catch {
            return []
        }
    }
}
