//
//  LeagueService.swift
//  FDJ_API
//
//  Created by ghulam  on 28/08/2023.
//

import SwiftUI

protocol LeagueServiceInterface {
    func getLeagues() async -> [League]
}

class LeagueService: LeagueServiceInterface {
    func getLeagues() async -> [League] {
            guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/50130162/all_leagues.php") else {
                return []
            }
        do {
            return try await withCheckedThrowingContinuation { continuation in
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let decodedResponse = try JSONDecoder().decode(LeagueResponse.self, from: data)
                            continuation.resume(returning: decodedResponse.leagues)
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
