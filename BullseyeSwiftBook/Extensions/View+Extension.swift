//
//  View+Extension.swift
//  BullseyeSwiftBook
//
//  Created by vtsyganov on 08.08.2021.
//

import SwiftUI

extension View {
    public func roundedText(color: Color, font: CGFloat, size: CGSize) -> some View {
        ModifiedContent(
            content: self,
            modifier: RoundedTextModifier(color: color, font: font, size: size)
        )
    }
}
