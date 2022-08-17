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
    @Published var showingDetails = false
    @Published var detailsShift : Shift?
    
    @Published var errorDetails : String?

    
    
    lazy var shiftsService : ShiftsService = resolver.resolve()
    
    @MainActor
    func loadNextShifts() async{
        do {
            let nextPlus7Days = self.nextDate.addingTimeInterval(24*60*60*7)

            self.loading = true
            let result = try await self.shiftsService.getShifts(request: ShiftServiceRequest(type: .List, start: self.nextDate, end: nextPlus7Days, address: "Dallas, TX", radius: 50))
            self.loading = false

            if let newShiftsByDate = result.data {
                self.addNewResultToSections(newShifts: newShiftsByDate)
            } else {
                self.errorDetails = result.alert?.message;
            }
        } catch {
            print(error)
            self.errorDetails = error.localizedDescription
        }
        
        
    }
    
    
    func showDetails(_ item:Shift) {
        
        self.detailsShift = item;
        self.showingDetails = true

    }
    
    private func addNewResultToSections(newShifts:[ShiftsWithDate]) {
        
        var newNextDate = Date();
        newNextDate = newShifts.reduce(nextDate) { partialResult, shiftsWithDate in
            return partialResult > shiftsWithDate.date ? partialResult : shiftsWithDate.date
        }
        self.nextDate = newNextDate

        
        let newWithoutEmptyAndDuplicates = newShifts.filter({ $0.shifts.count > 0 && !self.displayedDates().contains($0.date)})

        self.sections.append(contentsOf: newWithoutEmptyAndDuplicates)
        
    }
    
    private func displayedDates() -> [Date] {
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
