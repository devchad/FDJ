//
//  ContentView.swift
//  FDJ_API
//
//  Created by ghulam  on 24/08/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var body: some View {
        NavigationView {
           LeaguesListView(viewModel: LeaguesListViewModel(model: LeaguesListModel()))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
