//
//  LoadindButtonView.swift
//  HabitPro
//
//  Created by Felipe Domingos on 18/07/22.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var text: String
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            Button(action:    {
                    action()
                }, label: {
                    Text(showProgress ? "" : text)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 16)
                        .font(Font.system(.title3).bold())
                        .background(disabled ? Color("lightColor"):Color("buttonColor"))
                        .foregroundColor(.white)
                        .cornerRadius(4.0)
                        .padding()
                }).disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}
