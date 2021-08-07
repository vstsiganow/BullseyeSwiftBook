//
//  BullseyeView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct BullseyeView: View {
    @State var target: Int = Int.random(in: 0...100)
    @State var value: Double = 50
    @State var score: Int = 0
    @State var shots: Int = 0
    @State var showResult = false
    
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
                
                StatisticView(score: score, target: target, shots: shots)
                
                SliderView(sliderValue: $value, target: target)
                
                BullseyeButton(
                    title: "Проверь точность!",
                    size: buttonSize,
                    font: 16,
                    color: .red,
                    closure: {
                        updateScore()
                        showResult = true
                    }
                )
                .alert(isPresented: $showResult, content: {
                    Alert(title: Text(""), message: Text("Твоя точность - \(computeScore())%.\n Попробуешь еще?"), dismissButton: .default(Text("Еще раз!")))
        
                })
                
                BullseyeButton(
                    title: "Сбросить результат",
                    size: buttonSize,
                    font: 16,
                    color: .blue,
                    closure: {
                        resetScore()
                    }
                )
                
                Spacer()
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(target - lround(value))
        return 100 - difference
    }
    
    private func resetScore() {
        score = 0
        shots = 0
        setNewTarget()
    }
    
    private func setNewTarget() {
        target = Int.random(in: 0...100)
        //value = 50
    }
    
    private func updateScore() {
        score += computeScore()
        shots += 1
        setNewTarget()
    }
}

struct BullseyeView_Previews: PreviewProvider {
    static var previews: some View {
        BullseyeView()
    }
}
