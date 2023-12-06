//
//  TeamsListModelTest.swift
//  FDJ_APITests
//
//  Created by ghulam  on 26/09/2023.
//

import XCTest
@testable import FDJ_API

final class TeamsListViewModelTest: XCTestCase {
    
    var service: MockTeamService!
    var model: TeamsListModel!
    var viewModel: TeamsListViewModel!
    
    override func setUpWithError() throws {
        service = MockTeamService()
        model = TeamsListModel(teamService: service)
        viewModel = TeamsListViewModel(model: model, leagueName: "")
    }
    
    override func tearDownWithError() throws {
        // Effectuez une opération de nettoyage après chaque test si nécessaire
    }
    
    func testTeams() throws {
        let expectation = XCTestExpectation()
        
        // No search
        Task {
            model.teams = try await service.getTeams(for: "")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 100)
        
        
        let teams = viewModel.teams
        XCTAssertEqual(teams.count, 2)
        XCTAssertEqual(teams[0].idTeam, "1")
        XCTAssertEqual(teams[0].strTeam, "Brest")
        
        // When
        
        // Then
    }
}

final class MockTeamService: TeamServiceInterface {
    func getTeams(for teamName: String) async throws -> [Team] {
        return [
            Team(idTeam: "1", strTeam: "Brest", strTeamBadge: "1", strLeague: "1", strDescriptionEN: "1", strCountry: "1"),
            Team(idTeam: "2", strTeam: "Paris", strTeamBadge: "2", strLeague: "1", strDescriptionEN: "2", strCountry: "2")
        ]
    }
}
