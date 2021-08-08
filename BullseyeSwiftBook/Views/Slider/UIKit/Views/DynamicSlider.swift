//
//  DynamicSlider.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 07.08.2021.
//

import SwiftUI

struct DynamicSlider: UIViewRepresentable {
    @Binding var value: Double
    
    var game: GameManager
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.thumbTintColor = UIColor.red.withAlphaComponent(game.sliderAlpha)
        
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, game: game)
    }
}

extension DynamicSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        var game: GameManager
        
        init(value: Binding<Double>, game: GameManager) {
            self._value = value
            self.game = game
        }
        
        func getAlpha(value: Float, target: Int, const: Float ) -> CGFloat {
            let different = (Float(value) - Float(target))/const
            
            if different < -1 || different > 1 {
                return 0.01
            } else {
                return CGFloat(1 - abs(different))
            }
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            let senderValue = sender.value

            value = Double(senderValue)
            
            game.resetAlpha(value: senderValue)
            
            sender.thumbTintColor = .red.withAlphaComponent(game.sliderAlpha)
        }

    }
}


struct DynamicSlider_Previews: PreviewProvider {
    static var previews: some View {
        DynamicSlider(value: .constant(40), game: GameManager())
    }
}
