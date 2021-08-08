//
//  ShotsView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct ShotsView: View {
    @EnvironmentObject var game: GameManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Попыток:")
            
            Text("\(game.shots)")
                .roundedText(color: .blue, font: 16, size: CGSize(width: 50, height: 50))
        }
        .padding(10)
    }
}

struct ShotsView_Previews: PreviewProvider {
    static var previews: some View {
        ShotsView()
    }
}
