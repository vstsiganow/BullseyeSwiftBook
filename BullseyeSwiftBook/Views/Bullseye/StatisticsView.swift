//
//  StatisticsView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct StatisticsView: View {
    var title: String
    var info: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("\(title)")
            
            Text("\(info)")
                .roundedText(color: .blue, font: 16, size: CGSize(width: 50, height: 50))
        }
        .padding(10)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(title: "Счет", info: 12)
    }
}
