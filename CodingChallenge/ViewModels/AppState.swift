//
//  AppState.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import Foundation

class AppState : ObservableObject {
    //conector? 
}

extension AppState : Mockable {
    typealias ReturnType = AppState
    
    static var mocked: AppState {
        let state = AppState()
        return state
    }
}
