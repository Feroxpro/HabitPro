//
//  HabitProApp.swift
//  HabitPro
//
//  Created by Felipe Domingos on 11/07/22.
//

import SwiftUI

@main
struct HabitProApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
