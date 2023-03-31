//
//  SignInViewModel.swift
//  HabitPro
//
//  Created by Felipe Domingos on 12/07/22.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    private var cancellable: AnyCancellable?

    private let publisher = PassthroughSubject<Bool, Never>()
    
    @Published var uiState: SignInUIState = .none
    
    init() {
    cancellable = publisher.sink { value in
            print("Usuario Cadastrado! goToHome \(value)")
        
        if value {
            self.uiState = .goToHomeScreen
        }
    }
}
    
    deinit {
        cancellable?.cancel()
    }
    
    func login(email: String, password: String) {
         self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
         self.uiState = .error("Usuario não existe")
        }
    }
    
}

extension SignInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
    func signUpView() -> some View {
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}
