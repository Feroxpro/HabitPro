import Combine

var greeting = "Hello, playground"


//Programação Reativa

//SignInViewModel
var cancellable: AnyCancellable?

let publisher = PassthroughSubject<Bool, Never>()

//publisher.sink { value in
cancellable = publisher.sink { value in
        print(value)
    
}

//SignUpViewModel
// fazer uma ação  -> Notificar a SignInViewModel que algo aconteceu
var p: PassthroughSubject<Bool, Never> = publisher

//depois de apertar o botão e o servidor retornar SUCCESS!
print("Não enviou ainda")
cancellable?.cancel()
p.send(true)
print("Já Enviou")
