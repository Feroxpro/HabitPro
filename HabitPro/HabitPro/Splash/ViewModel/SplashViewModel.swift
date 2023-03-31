//
//  SplashViewModel.swift
//  HabitPro
//
//  Created by Felipe Domingos on 11/07/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            
            self.uiState = .goToSignInScreen
        }
    }
}
            
extension SplashViewModel {
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
