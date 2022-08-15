//
//  ShiftList.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import SwiftUI

struct ShiftList: View {
    @ObservedObject var shiftListViewModel : ShiftListViewModel
    
    var body: some View {
        
        ZStack {
            
            List(){
                ForEach(self.shiftListViewModel.sections ?? [], id: \.date ) { section in
                    Section(header: Text(section.date.YYYYMMDDString())) {
                        ForEach(section.shifts, id: \.shiftID ) { item in
                            ShiftCell(shift: item)
                            
                        }
                    }.onAppear {
                        if section == self.shiftListViewModel.sections?.last {
                            Task {
                                await self.shiftListViewModel.loadNextShifts()
                            }
                            
                        }
                    }
                }
            }
            
            if self.shiftListViewModel.loading {
                LoadingView()
            }
        }
        
    }
}

struct ShiftList_Previews: PreviewProvider {
    static var previews: some View {
        ShiftList(shiftListViewModel: ShiftListViewModel.mocked)
    }
}
