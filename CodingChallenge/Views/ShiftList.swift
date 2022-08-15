//
//  ShiftList.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import SwiftUI

struct ShiftList: View {
    @State var shiftListViewModel : ShiftListViewModel
    
    var body: some View {
        List(){
            
            ForEach(self.shiftListViewModel.sections ?? [], id: \.date ) { section in
                
                Section(header: Text(section.date.shortDate())) {
                    ForEach(section.shifts, id: \.shiftID ) { item in
                        ShiftCell(shift: item)

                    }
                }
            }
        }
    }
}

struct ShiftList_Previews: PreviewProvider {
    static var previews: some View {
        ShiftList(shiftListViewModel: ShiftListViewModel.mocked)
    }
}
