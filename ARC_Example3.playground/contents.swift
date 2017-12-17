import Cocoa



class Pessoa {
    var habilitação: Habilitação?
    
    deinit { print("Object Pessoa Released") }
}

class Habilitação {
    unowned let titular: Pessoa
    
    init(titular: Pessoa) {
        self.titular = titular
    }
    
    deinit { print("Object Habilitação Released") }
}

var pessoa: Pessoa? = Pessoa()
pessoa!.habilitação = Habilitação(titular: pessoa!)

pessoa = nil
