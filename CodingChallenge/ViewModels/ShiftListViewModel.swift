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
    @Published var loading = true

    
    lazy var shiftsService : ShiftsService = resolver.resolve()
    
    @MainActor
    func loadNextShifts() async{
        do {
            self.loading = true;
            let nextDatePlusOneWeek = self.nextDate.advanced(by: 60*60*24*7)
            let result = try await self.shiftsService.getShifts(request: ShiftServiceRequest(type: .List, start: self.nextDate, end: nextDatePlusOneWeek, address: "dallas, TX", radius: 5))
            if let newShiftsByDate = result.data {
                self.sections = newShiftsByDate
                
                var newNextDate = Date();
                newNextDate = newShiftsByDate.reduce(nextDate) { partialResult, shiftsWithDate in
                    return partialResult > shiftsWithDate.date ? partialResult : shiftsWithDate.date
                }
                self.nextDate = newNextDate;
                self.loading = false;
            }
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
