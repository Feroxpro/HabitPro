//
//  SplashView.swift
//  HabitPro
//
//  Created by Felipe Domingos on 11/07/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
           case .goToSignInScreen:
                viewModel.signInView()
            case .goToHomeScreen:
                Text("carregar tela inicial")
            case .error(let msg):
                loadingView(error: msg)
            }
        }.onAppear(perform: viewModel.onAppear)
    }
}
extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("Splash")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("HabitPro"), message: Text(error), dismissButton: .default(Text("OK")) {
                })
            }
        }
    }
}
                              }
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
        let viewModel = SplashViewModel()
            SplashView(viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .previewDevice("IPhone 11")
                .preferredColorScheme($0)
        }
    }
}
