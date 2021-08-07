//
//  SliderTextView.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 06.08.2021.
//

import SwiftUI

struct SliderTextView: View {
    var name: String
    let size = CGSize(
        width: 40,
        height: 40
    )
    
    var body: some View {
        Text(name)
            .roundedText(color: .black, font: 12, size: size)
    }
}

struct SliderTextView_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextView(name: "100")
    }
}


struct RoundedTextModifier: ViewModifier {
    var color: Color
    var font: CGFloat
    var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .font(.system(size: font))
            .foregroundColor(color)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 3))
        
    }
}

extension View {
    public func roundedText(color: Color, font: CGFloat, size: CGSize) -> some View {
        ModifiedContent(
            content: self,
            modifier: RoundedTextModifier(color: color, font: font, size: size)
        )
    }
}
