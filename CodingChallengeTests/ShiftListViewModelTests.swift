//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//  Created by Brady Miller on 4/7/21.
//

import XCTest
@testable import CodingChallenge

class ShiftListViewModelTests: XCTestCase {

    
    func testLoadNextShiftsIgnoreDuplicates() async throws {

        let vm = ShiftListViewModel()
        let mockShiftServce = MockShiftService();
        mockShiftServce.responseResult = ShiftServiceResponse(alert: nil, additional: nil, data: [ShiftsWithDate.mocked], meta: nil)
        vm.shiftsService = mockShiftServce
        await vm.loadNextShifts()
        await vm.loadNextShifts()
        await vm.loadNextShifts()

        XCTAssertTrue(vm.errorDetails == nil)
        XCTAssertTrue(vm.sections.count == 1)
        
    }

    
    func testLoadNextShiftsIgnoreEmptyDayShifts() async throws {

        let vm = ShiftListViewModel()
        let mockShiftServce = MockShiftService();
        mockShiftServce.responseResult = ShiftServiceResponse(alert: nil, additional: nil, data: [ShiftsWithDate(date: Date(), shifts: [])], meta: nil)
        vm.shiftsService = mockShiftServce
        await vm.loadNextShifts()

        XCTAssertTrue(vm.errorDetails == nil)
        XCTAssertTrue(vm.sections.count == 0)
        
    }


    
    func testLoadNextShiftsNegative() async throws {

        let vm = ShiftListViewModel()
        let mockShiftServce = MockShiftService();
        vm.shiftsService = mockShiftServce
        await vm.loadNextShifts()
        XCTAssertTrue(vm.errorDetails != nil)
        
    }
    
    
    


}
