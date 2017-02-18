//
//  SPTransClient.swift
//  Pods
//
//  Created by Ezequiel on 18/02/17.
//
//

import Foundation

public struct SPTransClient {
    
    private var requester: Requester

    public init(athenticationToken: String) {
        requester = Requester(athenticationToken: athenticationToken)
    }
    
    private func athenticationURL(base:String, token:String) -> String {
        return base + "/Login/Autenticar?token=" + token
    }
    
    func athentication(athenticationToken: String){
        
        requester.sendRequest(method: .post, endpoint: athenticationURL(base: requester.baseURL, token: athenticationToken), headers: [:], body: "") {
            (data, response, error) in
            print(data)
            print(response)
            return
        }
    }
}
