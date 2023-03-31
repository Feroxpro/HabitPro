//
//  SignInUIState.swift
//  HabitPro
//
//  Created by Felipe Domingos on 15/07/22.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
