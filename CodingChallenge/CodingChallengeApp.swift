//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

@main
struct CodingChallengeApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ShiftsView(shiftsViewModel: ShiftListViewModel()).environmentObject(appState)
        }
    }
}
