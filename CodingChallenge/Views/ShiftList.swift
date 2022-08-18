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
                ForEach(shiftListViewModel.sections, id: \.date ) { section in
                    Section(header: Text(section.date.YYYYMMDDString())) {
                        ForEach(section.shifts, id: \.shiftID ) { item in
                            ShiftCell(shift: item).onTapGesture {
                                shiftListViewModel.showDetails(item)
                            }
                            
                        }
                    }.onAppear {
                        if section == shiftListViewModel.sections.last {
                            Task {
                                await shiftListViewModel.loadNextShifts()
                            }
                            
                        }
                    }
                }
            }
            
            
            if let err = shiftListViewModel.errorDetails {
                Text(err).bold().background(Color.background).padding()
            }
            if shiftListViewModel.loading {
                LoadingView()
            }
            
        }
        .sheet(isPresented: $shiftListViewModel.showingDetails) {
            ShiftDetails(shift: shiftListViewModel.detailsShift!)
        }.listStyle(GroupedListStyle())
        
        
    }
}

struct ShiftList_Previews: PreviewProvider {
    static var previews: some View {
        ShiftList(shiftListViewModel: ShiftListViewModel.mocked)
    }
}
