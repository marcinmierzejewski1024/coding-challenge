//
//  ShiftListViewModel.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import Foundation
import Resolver

class ShiftListViewModel : ObservableObject, Resolving {
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
            let nextPlus7Days = nextDate.addingTimeInterval(24*60*60*7)
            
            loading = true
            let result = try await shiftsService.getShifts(request: ShiftServiceRequest(type: .list, start: nextDate, end: nextPlus7Days, address: "Dallas, TX", radius: 50))
            loading = false
            
            if let newShiftsByDate = result.data {
                addNewResultToSections(newShifts: newShiftsByDate)
            } else {
                errorDetails = result.alert?.message;
            }
        } catch {
            print(error)
            errorDetails = error.localizedDescription
        }
        
        
    }
    
    
    func showDetails(_ item:Shift) {
        
        detailsShift = item;
        showingDetails = true
        
    }
    
    private func addNewResultToSections(newShifts:[ShiftsWithDate]) {
        
        var newNextDate = Date();
        newNextDate = newShifts.reduce(nextDate) { partialResult, shiftsWithDate in
            return partialResult > shiftsWithDate.date ? partialResult : shiftsWithDate.date
        }
        nextDate = newNextDate
        
        
        let newWithoutEmptyAndDuplicates = newShifts.filter({ $0.shifts.count > 0 && !displayedDates().contains($0.date)})
        
        sections.append(contentsOf: newWithoutEmptyAndDuplicates)
        
    }
    
    private func displayedDates() -> [Date] {
        return sections.map { swd in
            swd.date
        }
        
    }
}


extension ShiftListViewModel : Mockable {
    typealias ReturnType = ShiftListViewModel
    
    static var mocked: ShiftListViewModel {
        let mock = ShiftListViewModel()
        mock.sections = [ShiftsWithDate.mocked, ShiftsWithDate.mocked, ShiftsWithDate.mocked, ShiftsWithDate.mocked]
        return mock
    }
    
}
