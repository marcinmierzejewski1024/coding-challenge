//
//  AppState.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import Foundation

class AppState : ObservableObject
{
    @Published var shiftsViewModel = ShiftListViewModel();
    
}


extension AppState : Mockable
{
    typealias T = AppState
    
    
    static var mocked: AppState {
        let state = AppState()
        state.shiftsViewModel = ShiftListViewModel.mocked;
        return state
    }
    
    
    
}
