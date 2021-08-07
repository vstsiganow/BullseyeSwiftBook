//
//  ScoreView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct ScoreView: View {
    var score: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Общий счет:")
            
            Text("\(score)")
                .roundedText(color: .blue, font: 16, size: CGSize(width: 50, height: 50))
        }
        .padding(10)
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 100)
    }
}
