//
//  SignUpUIState.swift
//  HabitPro
//
//  Created by Felipe Domingos on 16/07/22.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
