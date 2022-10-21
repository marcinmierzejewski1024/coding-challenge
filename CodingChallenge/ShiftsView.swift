//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @StateObject var shiftsViewModel : ShiftListViewModel
    
    var body: some View {
        NavigationView {
            Group {
                ShiftList(shiftListViewModel: shiftsViewModel).onAppear(){
                    Task {
                        await shiftsViewModel.loadNextShifts()
                    }
                }
            }
            .navigationTitle("Shifts")
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView(shiftsViewModel: ShiftListViewModel.mocked)
    }
}
