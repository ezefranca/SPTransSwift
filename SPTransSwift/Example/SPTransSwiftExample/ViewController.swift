//
//  ViewController.swift
//  SPTransSwiftExample
//
//  Created by Ezequiel on 18/02/17.
//  Copyright © 2017 Ezequiel. All rights reserved.
//

import UIKit
import SPTransSwift

class ViewController: UIViewController {
    
    var a:SPTransClient = SPTransClient(athenticationToken: "76139b0b198f36ccbba8d8004fd176fb56bba86bd020684aa68716bd7d259483")
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func pegarCorredores(_ sender: Any) {
        
        a.autenticar() { (status) in
            
            print("Esta autenticado?")
            print(status)
            
            self.a.pegarCorredores { (corredores, error) in
                print("Total de: \n" + String(describing: corredores!.count))
            }
        }
        

    }
    
    @IBAction func buscarDetalheLinha(_ sender: Any) {
        a.buscarDetalheLinha(termosBusca: "8000") { (linhas, error) in
            print("Total de Linhas: \n")
            print(String(describing: linhas!.count))
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

