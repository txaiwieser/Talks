import Cocoa


class Pessoa {
    var veículo: Carro?
    
    deinit { print("Object Pessoa Released") }
}

class Carro {
    weak var proprietário:Pessoa?
    
    deinit { print("Object Carro Released") }
}

var pessoa: Pessoa? = Pessoa()
var carro: Carro? = Carro()

pessoa!.veículo = carro
carro!.proprietário = pessoa


carro = nil
pessoa = nil



