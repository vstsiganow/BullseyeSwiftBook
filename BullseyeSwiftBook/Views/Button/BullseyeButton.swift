//
//  BullseyeButton.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct BullseyeButton: View {
    var title: String
    var size: CGSize
    var font: CGFloat
    var color: Color
    var closure: () -> Void
    
    var body: some View {
        
        Button(title, action: closure )
            .sliderButton(size: size, font: font, color: color)
    }
}

struct BullseyeButton_Previews: PreviewProvider {
    static var previews: some View {
        BullseyeButton(title: "Проверь меня!", size: CGSize(width: 130, height: 50), font: 16, color: .red, closure: {})
    }
}

struct ButtonModifier: ViewModifier {
    let size: CGSize
    let font: CGFloat
    let color: Color

    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height, alignment: .center)
            .font(.system(size: font))
            .foregroundColor(color)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(color, lineWidth: 3)
                        .shadow(color: color, radius: 2, x: 0, y: 0)
            )
    }
}


extension View {
    public func sliderButton(size: CGSize, font: CGFloat, color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonModifier(size: size, font: font, color: color)
        )
    }
}
