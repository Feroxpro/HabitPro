//
//  CustomTextFieldStyle.swift
//  HabitPro
//
//  Created by Felipe Domingos on 17/07/22.
//

import SwiftUI


struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color("overlayColor"), lineWidth: 0.8)
        )
    }
}
