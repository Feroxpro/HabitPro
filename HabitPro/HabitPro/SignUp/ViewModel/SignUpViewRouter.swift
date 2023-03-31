//
//  SignUpViewRouter.swift
//  HabitPro
//
//  Created by Felipe Domingos on 16/07/22.
//

import SwiftUI

enum SignUpViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
