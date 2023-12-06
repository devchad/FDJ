//
//  LeaguesListViewModelTest.swift
//  FDJ_APITests
//
//  Created by ghulam  on 20/09/2023.
//

import XCTest
@testable import FDJ_API

final class LeaguesListViewModelTest: XCTestCase {
    
    var service: MockLeagueService!
    var model: LeaguesListModel!
    var viewModel: LeaguesListViewModel!
    
    override func setUpWithError() throws {
        service = MockLeagueService()
        model = LeaguesListModel(leagueService: service)
        viewModel = LeaguesListViewModel(model: model)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLeagues() throws {
        let expectation = XCTestExpectation()
        //No search
        //Given
        Task {
            model.leagues = await service.getLeagues()
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        
        //When
        viewModel.searchText = ""
        
        //Then
        var leagues = viewModel.leagues
        XCTAssertEqual(leagues.count, 4)
        XCTAssertEqual(leagues[0].idLeague, "1")
        XCTAssertEqual(leagues[0].strLeague, "League1")
        
        
        //Valid search
        
        //Given
        
        //When
        viewModel.searchText = "Ligue"
        
        //Then
        leagues = viewModel.leagues
        XCTAssertEqual(leagues.count, 1)
        XCTAssertEqual(leagues[0].idLeague, "3")
        XCTAssertEqual(leagues[0].strLeague, "Ligue1")
        
        
        //Invalid search
        
        //Given
        
        //When
        viewModel.searchText = "Kamoulox"
        
        //Then
        leagues = viewModel.leagues
        XCTAssertEqual(leagues.count, 0)
    }
}

final class MockLeagueService: LeagueServiceInterface {
    func getLeagues() async -> [League] {
        return [
            League(idLeague: "1", strLeague: "League1"),
            League(idLeague: "2", strLeague: "League2"),
            League(idLeague: "3", strLeague: "Ligue1"),
            League(idLeague: "4", strLeague: "Match3")
        ]
    }
}
