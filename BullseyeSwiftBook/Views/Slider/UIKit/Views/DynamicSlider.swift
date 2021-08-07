//
//  DynamicSlider.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 07.08.2021.
//

import SwiftUI

struct DynamicSlider: UIViewRepresentable {
    @Binding var value: Double
    
    @State private var alpha: CGFloat = 1.0
    
    var target: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
        
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        
        slider.addTarget(context.coordinator, action: #selector(Coordinator.aplhaChanged(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alpha: $alpha, target: target)
    }
}

extension DynamicSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var alpha: CGFloat
        
        var target: Int
        
        init(value: Binding<Double>, alpha: Binding<CGFloat> ,target: Int) {
            self._value = value
            self.target = target
            self._alpha = alpha
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
        }
        
        @objc func aplhaChanged(_ sender: UISlider) {
            let senderValue = sender.value
            let const: Float = 50
            
            let newAlpha = getAlpha(value: senderValue, target: target, const: const)
            
            sender.thumbTintColor = .red.withAlphaComponent(newAlpha)
        }
        
    }
}


struct DynamicSlider_Previews: PreviewProvider {
    static var previews: some View {
        DynamicSlider(value: .constant(40), target: 50)
    }
}
