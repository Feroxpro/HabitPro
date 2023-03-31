//
//  SignUpView.swift
//  HabitPro
//
//  Created by Felipe Domingos on 15/07/22.
//

import SwiftUI

struct SignUpView: View {

    
    @State var fullName = ""
    @State var password = ""
    @State var email = ""
    @State var document = ""
    @State var phone = ""
    @State var birthday = ""
    @State var gender = Gender.male
    
    @State var action: Int? = 0
    @State var NavigationHidden = true
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            
            NavigationView {
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .center) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Cadastro")
                                .foregroundColor(Color("textColor"))
                                .font(Font.system(.title).bold())
                                .padding(8)
                            
                            
                            fullNameField
                            emailField
                            passwordField
                            documentField
                            phoneField
                            birthdayField
                            genderField
                            saveButton
                            
                            
                            }
                       }.frame(maxWidth:.infinity, maxHeight:.infinity)
                        .padding(.horizontal, 25)
                        .navigationBarTitle("Login", displayMode: .inline)
                        .navigationBarHidden(NavigationHidden)
                    Spacer()
                }.padding(.horizontal, 8)
            }.padding()
            
            if case SignUpUIState.error(let value) =
                viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("HabitPro"), message: Text(value), dismissButton: .default(Text("OK")) {
                   })
                }
            }
        }
    }
}
extension SignUpView {
    var fullNameField: some View {
        EditTextView(text: $fullName,
                     placeholder: "Nome Completo",
                     keyboard: .alphabet,
                     error: "Insira o nome completo",
                     failure: fullName.count < 5)
        }
    }
extension SignUpView {
    var emailField: some View {
        EditTextView(text: $email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "Digite um e-mail Inválido",
                     failure: !email.isEmail())
    }
}
extension SignUpView {
    var passwordField: some View {
        EditTextView(text: $password,
                     placeholder: "Senha",
                     keyboard: .emailAddress,
                     error: "Senha deve ter pelo menos 8 caracteres",
                     failure: password.count < 8,
                     isSecure: true)
    }
}
extension SignUpView {
    var documentField: some View {
        EditTextView(text: $document,
                     placeholder: "CPF",
                     keyboard: .numberPad,
                     error: "CPF inválido",
                     failure: document.count != 10)
    }
}
extension SignUpView {
    var phoneField: some View {
        EditTextView(text: $phone,
                     placeholder: "Celular com DDD",
                     keyboard: .numberPad,
                     error: "Telefone Invalido",
                     failure: phone.count < 10 || phone.count > 12)
    }
}

extension SignUpView {
    var birthdayField: some View {
        EditTextView(text: $birthday,
                     placeholder: "Data Nascimento DD/MM/YYYY",
                     keyboard: .alphabet,
                     error: "Data de nascimento Invalida",
                     failure: birthday.count < 10)
    }
}
extension SignUpView {
    var genderField: some View {
        
        Picker("Gender", selection: $gender) {
            ForEach(Gender.allCases, id: \.self) { value in
            Text(value.rawValue)
                    .tag(value)
            }

        }.pickerStyle(SegmentedPickerStyle())
            .padding(.top, 16)
            .padding(.bottom, 32)
    }
}
extension SignUpView {
  var saveButton: some View {
    LoadingButtonView(action: {
      viewModel.signUp()
    },
    text: "Realize o seu Cadastro",
    showProgress: self.viewModel.uiState == SignUpUIState.loading,
    disabled: !email.isEmail() ||
      password.count < 8 ||
      fullName.count < 3 ||
      document.count != 11 ||
      phone.count < 10 || phone.count >= 12 ||
      birthday.count != 10)
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self) {
      SignUpView(viewModel: SignUpViewModel())
        .previewDevice("iPhone 11")
        .preferredColorScheme($0)
    }
    
  }
}
