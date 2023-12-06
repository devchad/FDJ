//
//  LeaguesListViewModel.swift
//  FDJ_API
//
//  Created by ghulam  on 06/09/2023.
//

import Combine
import SwiftUI

class LeaguesListViewModel: ObservableObject {
    @ObservedObject var model: LeaguesListModel
    var anyCancellable: AnyCancellable?
    @Published var searchText: String
    
    var leagues: [League] {
        guard searchText.isEmpty == false else {
            return model.leagues
        }
        return model.leagues.filter { league in
            league.strLeague.contains(searchText)
        }
    }
    
    init(model: LeaguesListModel) {
        self.model = model
        self.searchText = ""
        anyCancellable = model.objectWillChange.sink { [weak self] (_) in
            self?.objectWillChange.send()
            
        }
    }
    func fetchLeagues() {
        model.fetchLeagues()
    }
}
