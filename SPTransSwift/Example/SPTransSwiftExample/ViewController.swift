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
    
    var a:SPTransClient = SPTransClient(athenticationToken: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        a.autenticar(athenticationToken:"76139b0b198f36ccbba8d8004fd176fb56bba86bd020684aa68716bd7d259483")
        
        print("autenticado")
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pegarCorredores(_ sender: Any) {
        a.pegarCorredores() {_,_,_ in
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

