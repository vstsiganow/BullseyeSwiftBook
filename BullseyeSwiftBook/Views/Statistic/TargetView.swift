//
//  TargetView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct TargetView: View {
    @EnvironmentObject var game: GameManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Цель:")
            
            Text("\(game.target)")
                .roundedText(color: .blue, font: 16, size: CGSize(width: 50, height: 50))
        }
        .padding(10)
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView()
    }
}
