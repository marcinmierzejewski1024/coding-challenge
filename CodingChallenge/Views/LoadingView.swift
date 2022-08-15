//
//  LoadingView.swift
//  CodingChallenge
//
//  Created by Marcin Mierzejewski on 15/08/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack{
            ProgressView().frame(width: 30, height: 30, alignment: .center)
            Text("Loading").font(.caption).bold().foregroundColor(.black)
        }.padding(8).background(RoundedRectangle(cornerRadius: 4)
            .foregroundColor(.white)
            .shadow(color: Color.gray.opacity(0.7), radius: 8, x: 0, y: 4))
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
