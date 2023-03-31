//
//  SplashUIState.swift
//  HabitPro
//
//  Created by Felipe Domingos on 11/07/22.
//

import Foundation
import SwiftUI

enum SplashUIState {
    case loading
    case goToSignInScreen
    case goToHomeScreen
    case error(String)
}

