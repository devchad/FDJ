//
//  TeamsListDetailModel.swift
//  FDJ_API
//
//  Created by ghulam  on 11/09/2023.
//

import Foundation
import Combine
import SwiftUI

class TeamsDetailViewModel: ObservableObject {
    var model: TeamsDetailModel
    
    var leagueName: String {
        return model.leagueName
    }
    
    var teamName: String {
        return model.team.strTeam ?? "N/A"
    }
    
    var teamDescription: String {
        return model.team.strDescriptionEN ?? "N/A"
    }
    
    var strLeag: String {
        return model.team.strLeague ?? "N/A"
    }
    
    var strCount: String {
        return model.team.strCountry ?? "N/A"
    }
    
    init(model: TeamsDetailModel) {
        self.model = model
    }
}
