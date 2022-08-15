//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @EnvironmentObject var appState : AppState;
    
    var body: some View {
        NavigationView {
            Group {
                ShiftList(shiftListViewModel: appState.shiftsViewModel).onAppear(){
                    Task {
                        ShiftsWithDate.mocked
                        await appState.shiftsViewModel.loadNextShifts()
                    }
                }
                

            }
            .navigationTitle("Shifts")
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}
