//
//  Game.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 08.08.2021.
//

import SwiftUI

final class GameManager: ObservableObject {
    @Published var sliderAlpha: CGFloat = 1.0
    @Published var target: Int = Int.random(in: 0...100)
    @Published var score: Int = 0
    @Published var shots: Int = 0
    
    var roundResult: Int = 0
    let calculateAlphaConst: Float = 50.0
    let starSliderValue: Float = 50
    
    init() {
        resetAlpha(value: starSliderValue)
    }
    
    func printAll(_ place: String) {
        print("sliderAlpha=\(sliderAlpha) || target=\(target) || score=\(score) || shots=\(shots) || roundResult=\(roundResult) == where: \(place)")
    }
    
    func updateGame(value: Float) {
        printAll("Start upd")
        roundResult = computeScore(value: Double(value))
        score += roundResult
        shots += 1
        setNewTarget()
        resetAlpha(value: value)
        printAll("End upd")
        
    }
    
    func resetGame(value: Float) {
        score = 0
        shots = 0
        roundResult = 0
        setNewTarget()
        resetAlpha(value: value)
        printAll("reset")
    }
    
    func resetAlpha(value: Float) {
        let different = (Float(value) - Float(target))/calculateAlphaConst
        
        if different < -1 || different > 1 {
            sliderAlpha = 0.01
        } else {
            sliderAlpha = CGFloat(1 - abs(different))
        }
    }
    
    private func setNewTarget() {
        target = Int.random(in: 0...100)
    }
    
    private func computeScore(value: Double) -> Int {
        let difference = abs(target - lround(value))
        return 100 - difference
    }
    
}
