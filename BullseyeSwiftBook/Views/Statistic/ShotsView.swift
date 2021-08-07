//
//  ShotsView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct ShotsView: View {
    var shots: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Попыток:")
            
            Text("\(shots)")
                .roundedText(color: .blue, font: 16, size: CGSize(width: 50, height: 50))
        }
        .padding(10)
    }
}

struct ShotsView_Previews: PreviewProvider {
    static var previews: some View {
        ShotsView(shots: 5)
    }
}
