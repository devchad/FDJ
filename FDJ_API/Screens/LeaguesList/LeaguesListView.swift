//
//  LeaguesListView.swift
//  FDJ_API
//
//  Created by ghulam  on 06/09/2023.
//

import SwiftUI

struct LeaguesListView: View {
    @ObservedObject var viewModel: LeaguesListViewModel
    
    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchText)
            
            List(viewModel.leagues) { league in
                NavigationLink(destination: TeamsListView(viewModel: TeamsListViewModel(model: TeamsListModel(), leagueName: league.strLeague), teamName: league.strLeague)) {
                    HStack {
                        Text(league.strLeague)
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.vertical, 5)
                }
                .listRowBackground(Color.clear)
            }
            .onAppear {
                viewModel.fetchLeagues()
            }
            .navigationBarTitle("Leagues", displayMode: .inline)
            .padding()
        }
        .background(Image("football_background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all))
    }
}

struct LeaguesListView_Previews: PreviewProvider {
    static var previews: some View {
        LeaguesListView(viewModel: LeaguesListViewModel(model: LeaguesListModel()))
    }
}
