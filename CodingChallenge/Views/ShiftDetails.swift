//
//  ShiftDetails.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import SwiftUI

struct ShiftDetails: View {
    let shift : Shift;
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            VStack(alignment: .leading) {
                
                ShiftCell(shift: shift).padding(.bottom, 20)
                
                Section(header:Text("Details").bold()){
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "map")
                            Text("Distance"+" < " + "\(shift.withinDistance) mi.")
                        }.font(.footnote)
                        
                        HStack {
                            Image(systemName: "dollarsign.circle")
                            Text((shift.premiumRate ? "Premium rate" : "Standard rate"))
                        }.font(.footnote)
                    }.padding(.vertical, 8)
                }
                
                
            }
            Spacer()
            Button {
                print("TODO:")
            } label: {
                Text("Order service")
                    .padding(20)
            }
            
        }.padding()
    }
}

struct ShiftDetails_Previews: PreviewProvider {
    static var previews: some View {
        ShiftDetails(shift: Shift.mocked)
    }
}
