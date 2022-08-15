//
//  PillView.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import SwiftUI

struct PillView: View {
    let color: Color
    let text: String
    
    var body: some View {
        Text(text).font(.smallCaps(.footnote)())
.foregroundColor(.white)
            .padding(4)
            .background(color)
            .clipShape(Capsule())
    }
}

struct PillView_Previews: PreviewProvider {
    static var previews: some View {
        PillView(color: .blue, text: "LONG TERM CARE")
    }
}
