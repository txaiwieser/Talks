//: Playground - noun: a place where people can play

import UIKit

class Cena: UIViewController {
    
    init() {
        
        let clsosure: (()->())? = { [weak self] in
            if let strongSelf = self {
                strongSelf.view.alpha = 0.0
            }
        }
        
        let resource = UIViewController()
        
        let closure: (()->())? = { [weak self, weak resource] in
            if let strongSelf = self {
                strongSelf.view.alpha = 0.0
            }
            
            resource?.view.alpha = 0.0
        }
        
        
        
        closure?()
        closure2?()
    }
    
    deinit {
        print("hey")
    }
}


var cena: Cena? = Cena()

cena = nil
