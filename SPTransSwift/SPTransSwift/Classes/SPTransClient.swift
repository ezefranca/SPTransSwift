//
//  SPTransClient.swift
//  Pods
//
//  Created by Ezequiel on 18/02/17.
//
//

import Foundation

public struct SPTransClient {
    
    public typealias RequestCompletion = (Data?, URLResponse?, Error?) -> Void
    private var requester: Requester

    public init(athenticationToken: String) {
        requester = Requester(athenticationToken: athenticationToken)
    }
    
    private func athenticationURL(token:String) -> String {
        return "/Login/Autenticar?token=" + token
    }
    
    public func autenticar(athenticationToken: String){
        
        requester.sendRequest(method: .post, endpoint: athenticationURL(token: athenticationToken), headers: [:], body: "") {
            (data, response, error) in
            print(data)
            print(response)
            return
        }
    }
    
    private func genericGET(_ endpoint:String, completionHandler: @escaping RequestCompletion) {
        requester.sendRequest(method: .get, endpoint: endpoint, headers: [:], body: "") {
            (data, response, error) in
            print(data)
            print(response)
            completionHandler(data, response, error)
            return
        }
    }
    
    func buscarDetalheLinha(termosBusca: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Linha/Buscar?termosBusca=" + termosBusca, completionHandler: completionHandler)
    }
    
    func carregarDetalhesLinha(codigoLinha: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Linha/CarregarDetalhes?codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    func buscarParada(termosBusca: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Parada/Buscar?termosBusca=" + termosBusca, completionHandler: completionHandler)
    }
    
    func buscarParadaPorLinha(codigoLinha: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Parada/BuscarParadasPorLinha?codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    func buscarParadaPorCorredor(codigoCorredor: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Parada/BuscarParadasPorCorredor?codigoCorredor=" + codigoCorredor, completionHandler: completionHandler)
    }
    
    public func pegarCorredores(completionHandler: @escaping RequestCompletion) {
        genericGET("/Corredor", completionHandler: completionHandler)
    }
    
    func pegarPosicaoOnibus(codigoLinha: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Posicao?codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    func pegarTempoDeChegadaDeUmOnibusNaParada(codigoLinha: String, codigoParada: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Previsao?codigoParada=" + codigoParada + "&codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    func pegarTemposDeChegadaParada(codigoParada: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Previsao/Parada?codigoParada=" + codigoParada, completionHandler: completionHandler)
    }
    
}
