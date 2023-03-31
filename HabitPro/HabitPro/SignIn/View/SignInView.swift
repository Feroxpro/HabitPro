//
//  SignInView.swift
//  HabitPro
//
//  Created by Felipe Domingos on 12/07/22.

import Foundation
import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel

    @State var action: Int? = 0
    @State var NavigationHidden = true
    
    var body: some View {
        ZStack     {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView {
                    
                     ScrollView (showsIndicators: false) {
                         
                         VStack(alignment: .center, spacing: 20) {
                             
                             Spacer(minLength: 36)
                         
                         VStack(alignment: .center, spacing: 8) {
                             
                             Image("Splash")
                                 .resizable()
                                 .scaledToFit()
                                 .padding(.horizontal, 48)
                             
                             Text("LOGIN")
                                 .foregroundColor(Color("buttonColor"))
                                 .font(Font.system(.title).bold())
                                         .padding(.bottom, 8)
                             
                             emailField
                             passwordField
                             enterButton
                             registerLink
                             
                             Text("Copyright - AT Digital Ltda")
                                 .font(Font.system(size: 13).bold())
                                 .foregroundColor(Color.gray)
                                 .padding(.top, 60)
                            }
                         }
                         if case SignInUIState.error(let value) = viewModel.uiState {
                                Text("")
                                    .alert(isPresented: .constant(true)) {
                                        Alert(title: Text("HabitPro"), message: Text(value), dismissButton: .default(Text("OK")) {
                                })
                            }
                         }
                     }
                     .frame(maxWidth:.infinity, maxHeight:.infinity)
                     .padding(.horizontal, 25)
                     .navigationBarTitle("Login", displayMode: .inline)
                     .navigationBarHidden(NavigationHidden)
                }
            }
        }
    }
}
extension SignInView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "Email Inválido",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignInView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
                     placeholder: "Senha",
                     keyboard: .emailAddress,
                     error: "Senha deve ter pelo menos 8 caracteres",
                     failure: viewModel.password.count < 8,
                     isSecure: true)
    }
}
extension SignInView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.login(email: viewModel.email, password: viewModel.password)
        },
        text: "Entrar",
        showProgress: self.viewModel.uiState == SignInUIState.loading,
                          disabled: !viewModel.email.isEmail() || viewModel.password.count < 8)
        }
    }
extension SignInView {
    var registerLink: some View {
        VStack {
         Text("Não possui login?")
            .foregroundColor(Color.gray)
            .padding(.top, 48)
        
            ZStack {
                NavigationLink(
                    destination: viewModel.signUpView(),
                        tag: 1,
                        selection: $action,
                        label: { EmptyView() })
                Button("Realize seu cadastro aqui!") {
                    
                    self.action = 1
                }.foregroundColor(Color("buttonColor"))
           }
        }
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .previewDevice("IPhone 11")
                .preferredColorScheme($0)
        }
    }
}
