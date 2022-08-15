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
    @Published var sections = [ShiftsWithDate]()
    @Published var nextDate = Date()
    @Published var loading = true

    
    lazy var shiftsService : ShiftsService = resolver.resolve()
    
    @MainActor
    func loadNextShifts() async{
        do {
            self.loading = true;
            let nextPlus7Days = self.nextDate.addingTimeInterval(24*60*60*7)
            
            let result = try await self.shiftsService.getShifts(request: ShiftServiceRequest(type: .List, start: self.nextDate, end: nextPlus7Days, address: "dallas,TX", radius: 5))
            if let newShiftsByDate = result.data {
                self.addNewResultToSections(newShifts: newShiftsByDate)
                
                self.loading = false;
            }
        } catch {
            print(error)
        }
    }
    
    
    private func addNewResultToSections(newShifts:[ShiftsWithDate]) {
        
        var newNextDate = Date();
        newNextDate = newShifts.reduce(nextDate) { partialResult, shiftsWithDate in
            return partialResult > shiftsWithDate.date ? partialResult : shiftsWithDate.date
        }
        self.nextDate = newNextDate;

        
        let newWithoutEmptyAndDuplicates = newShifts.filter({ $0.shifts.count > 0 && !self.displayedDates().contains($0.date)})

        self.sections.append(contentsOf: newWithoutEmptyAndDuplicates)
        
    }
    
    private func displayedDates() -> [Date]{
        return self.sections.map { swd in
            swd.date
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
