//
//  ShiftListViewModel.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation

class ShiftListViewModel : ObservableObject
{
    @Published var shifts : [Shift]?;
    
}


extension ShiftListViewModel : Mockable {
    typealias T = ShiftListViewModel
    
    static var mocked: ShiftListViewModel {
        let mock = ShiftListViewModel()
        mock.shifts = [Shift.mocked, Shift.mocked, Shift.mocked, Shift.mocked]
        return mock
    }
    
}
