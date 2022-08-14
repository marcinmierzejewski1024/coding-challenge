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
        Text(shift.shiftKind)
    }
}

struct ShiftCell_Previews: PreviewProvider {
    static var previews: some View {
        ShiftCell(shift: Shift.mocked)
    }
}
