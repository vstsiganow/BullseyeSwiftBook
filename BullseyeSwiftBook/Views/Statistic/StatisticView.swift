//
//  StatisticsView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct StatisticView: View {
    var score: Int
    var target: Int
    var shots: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            ScoreView(score: score)
            
            TargetView(target: target)
            
            ShotsView(shots: shots)
        }
        .padding(20)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(score: 1, target: 1, shots: 1)
    }
}
