//
//  SliderView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    var game: GameManager
    
    var body: some View {
        
        HStack(spacing: 10) {
            SliderTextView(name: "0")
            
            ///Slider(value: $sliderValue, in: 0...100, step: 1) // Оригинальный сладйдер SwiftUI для сравнения
            DynamicSlider(value: $sliderValue, game: game)
            
            SliderTextView(name: "100")
        }
        .padding(10)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(10), game: GameManager())
    }
}
