//
//  StatisticsView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct StatisticView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            ScoreView()
            
            TargetView()
            
            ShotsView()
        }
        .padding(20)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
