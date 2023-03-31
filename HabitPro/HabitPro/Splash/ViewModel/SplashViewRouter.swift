//
//  SplashViewRouter.swift
//  HabitPro
//
//  Created by Felipe Domingos on 12/07/22.
//

import SwiftUI

enum SplashViewRouter {
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
