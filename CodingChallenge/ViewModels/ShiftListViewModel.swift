//
//  ShiftListViewModel.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation
import Resolver

class ShiftListViewModel : ObservableObject, Resolving
{
    @Published var sections : [ShiftsWithDate]?
    @Published var nextDate = Date()
    
    lazy var shiftsService : ShiftsService = resolver.resolve()
    
    
    func loadNextShifts() async{
        do {
            let result = try await self.shiftsService.getShifts(request: ShiftServiceRequest(type: .List, start: self.nextDate, end: nil, address: "dallas, TX", radius: 5))
            if let newShiftsByDate = result.data {
                self.sections = newShiftsByDate
                self.objectWillChange.send()
            }
//            print(result)
        } catch {
            print(error)
        }
    }
}


extension ShiftListViewModel : Mockable {
    typealias T = ShiftListViewModel
    
    static var mocked: ShiftListViewModel {
        let mock = ShiftListViewModel()
        mock.sections = [ShiftsWithDate.mocked, ShiftsWithDate.mocked, ShiftsWithDate.mocked, ShiftsWithDate.mocked]
        return mock
    }
    
}
