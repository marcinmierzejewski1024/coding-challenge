//
//  ShiftCell.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 14/08/2022.
//

import SwiftUI

struct ShiftCell: View {
    let shift : Shift;
    
    
    var body: some View {
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(shift.localizedSpecialty.name).bold()
                    Spacer()
                    PillView(color: Color(shift.skill.color) , text: shift.skill.name)
                }
                HStack {
                    Image(systemName: "clock")
                    Text(shift.startTime.shortTime() + " - " + shift.endTime.shortTime())
                }.font(.footnote)
                
                HStack {
                    Image(systemName: "book")
                    Text(shift.facilityType.name)
                }.font(.footnote)
                
            
            }.background(Color.background)
        
        
        
    }
}

struct ShiftCell_Previews: PreviewProvider {
    static var previews: some View {
        ShiftCell(shift: Shift.mocked)
    }
}
