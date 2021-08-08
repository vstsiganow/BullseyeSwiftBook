//
//  BullseyeView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct BullseyeView: View {
    @State var value: Double = 50
    @State var showResult = false
    
    @EnvironmentObject var game: GameManager
    
    let buttonSize = CGSize(
        width: 130,
        height: 50
    )
    
    var body: some View {
        ZStack {
            Color.orange
                .opacity(0.6)
                .ignoresSafeArea()

            VStack(alignment: .center, spacing: 40) {
                Text("Попади в цель!")
                    .font(.title)
                    .bold()
                    .foregroundColor(.red)
                        .opacity(0.9)
                    .padding(20)
                
                HStack(alignment: .bottom, spacing: 10) {
                    StatisticsView(title: "Счет", info: game.score)
                    
                    StatisticsView(title: "Цель", info: game.target)
                    
                    StatisticsView(title: "Раунд", info: game.shots)
                }
                .padding(20)
                
                SliderView(sliderValue: $value, game: game)
                
                BullseyeButton(
                    title: "Проверь точность!",
                    size: buttonSize,
                    font: 16,
                    color: .red,
                    closure: {
                        game.updateGame(value: Float(value))
                        showResult = true
                    }
                )
                .alert(isPresented: $showResult, content: {
                    Alert(
                        title: Text(""),
                        message: Text("Твоя точность - \( game.roundResult)%.\n Попробуешь еще?"),
                        dismissButton: .default(Text("Еще раз!"))
                    )
                })
                
                BullseyeButton(
                    title: "Сбросить результат",
                    size: buttonSize,
                    font: 16,
                    color: .blue,
                    closure: {
                        game.resetGame(value: Float(value))
                    }
                )
                
                Spacer()
            }
        }
    }
}

struct BullseyeView_Previews: PreviewProvider {
    static var previews: some View {
        BullseyeView()
    }
}
