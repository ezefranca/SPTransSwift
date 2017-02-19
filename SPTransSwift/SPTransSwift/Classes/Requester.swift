//
//  Requester.swift
//  Pods
//
//  Created by Ezequiel on 18/02/17.
//
//

import Foundation

struct Requester {
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    let baseURL = "http://api.olhovivo.sptrans.com.br/v0"
    var token:String
    let session: URLSession
    
    
    init(athenticationToken: String) {
        
        let sessionConfiguration = URLSessionConfiguration.default
        session = URLSession(configuration: sessionConfiguration)
        token = athenticationToken
    
    }
    
    func sendRequest(method: Method,
                     endpoint: String,
                     headers: [String: String] = [:],
                     body: String,
                     completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        guard let URL = URL(string: baseURL + endpoint) else { return }
        let request = NSMutableURLRequest(url: URL as URL)
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body.data(using: String.Encoding.utf8, allowLossyConversion: true)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
        task.resume()
    }
}
