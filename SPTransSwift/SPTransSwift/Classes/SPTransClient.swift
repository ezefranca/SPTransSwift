//
//  SPTransClient.swift
//  Pods
//
//  Created by Ezequiel on 18/02/17.
//
//

import Foundation

public struct SPTransClient {
    
    public typealias RequestCompletion = ([[String:AnyObject]]?, NSError?) -> Void
    private var requester: Requester
    
    // MARK : Construtor
    
    /// Public init
    ///
    /// - Parameter athenticationToken: sua chave de autenticação
    public init(athenticationToken: String) {
        if athenticationToken.isEmpty {
            fatalError("Você precisa de uma chave válida para utilizar a API do Olho Vivo")
        }
        requester = Requester(athenticationToken: athenticationToken)
    }
    

    // MARK: Autenticação
    
    /// Para autenticar-se no serviço de API do Olho Vivo é necessário efetuar uma chamada prévia utilizando o método http POST informando seu token de acesso. Essa chamada irá retornar true quando a autenticação for realizada com sucesso e false em caso de erros.
    ///
    /// - Parameter completion: Callback com Boolean (true autenticado, false não autenticado)
    public func autenticar(completion:@escaping (Bool)->()){
        
        requester.sendRequest(method: .post, endpoint: athenticationURL(token: requester.token), headers: [:], body: "") {
            (data, response, error) in
            guard let response = response,
                let httpResponse:HTTPURLResponse = response as! HTTPURLResponse else {
                completion(false)
                return
            }

            if httpResponse.statusCode == 200 {
                completion(true)
                return
            }

            completion(false)
        }
    }
    

    
    // MARK: (Linhas) /Linhas
    
    /// Realiza uma busca das linhas do sistema com base no parâmetro informado. Se a linha não é encontrada então é realizada uma busca fonetizada na denominação das linhas.
    ///
    /// - Parameters:
    ///   - termosBusca: Aceita denominação ou número da linha (total ou parcial). Exemplo: 8000, Lapa ou Ramos
    ///   - completion: Callback com array [Linha]? com todas as linhas referentes a busca.
    public func buscarDetalheLinha(termosBusca: String, completion: @escaping ([Linha]?, NSError?) -> Void) {
        self.buscarDetalheLinha(termosBusca: termosBusca, completionHandler: { (linhasArray, error) in
            guard let linhasArray = linhasArray else { completion(nil, nil); return }
            var linhas = linhasArray.map {Linha($0)}
            completion(linhas, nil)
        })
    }
    
    /// Retorna as informações cadastrais de uma determinada linha. Caso o parâmetro seja omitido são retornados os dados de todas as linhas do sistema.
    ///
    /// - Parameters:
    ///   - codigoLinha: código da linha a ser buscada (String)
    ///   - completion: Callback com array [Linha]? com todas as linhas referentes a busca.
    func carregarDetalhesLinha(codigoLinha: String, completion: @escaping ([Linha]?, NSError?) -> Void) {
        
        self.carregarDetalhesLinha(codigoLinha: codigoLinha, completionHandler: { (linhasArray, error) in
            guard let linhasArray = linhasArray else { completion(nil, nil); return }
            var linhas = linhasArray.map {Linha($0)}
            completion(linhas, nil)
        })
        
    }
    
    // MARK: (Paradas) /Paradas
    
    /// Realiza uma busca fonética das paradas de ônibus do sistema com base no parâmetro informado. A consulta é realizada no nome da parada e também no seu endereço de localização.
    ///
    /// - Parameters:
    ///   - termosBusca: Aceita nome da parada ou endereço de localização (total ou parcial). Exemplo: Afonso, ou Balthazar da Veiga
    ///   - completion: Callback com array [Parada]? com todas as paradas referentes a busca.
    
    func buscarParada(termosBusca: String, completion: @escaping ([Parada]?, NSError?) -> Void) {
        self.buscarParada(termosBusca: termosBusca, completionHandler: { (paradasArray, error) in
            guard let paradasArray = paradasArray else { completion(nil, nil); return }
            var paradas = paradasArray.map {Parada($0)}
            completion(paradas, nil)
        })
        
    }
    
    /// Realiza uma busca por todos os pontos de parada atendidos por uma determinada linha.
    ///
    /// - Parameters:
    ///   - codigoLinha: Código identificador da linha. Este é um código identificador único de cada linha do sistema (por sentido) e pode ser obtido através do método buscarDetalheLinha
    ///   - completion: Callback com array [Parada]? com todas as paradas referentes a busca.

    public func buscarParadaPorLinha(codigoLinha: String, completion: @escaping ([Parada]?, NSError?) -> Void) {
        self.buscarParadaPorLinha(codigoLinha: codigoLinha, completionHandler: { (paradasArray, error) in
            guard let paradasArray = paradasArray else { completion(nil, nil); return }
            var paradas = paradasArray.map {Parada($0)}
            completion(paradas, nil)
        })
        
    }
    
    
    /// Retorna a lista detalhada de todas as paradas que compõem um determinado corredor.
    ///
    /// - Parameters:
    ///   - codigoCorredor: Código identificador do corredor. Este é um código identificador único de cada corredor do sistema e pode ser obtido através do método pegarCorredores
    ///   - completion: Callback com array [Parada]? com todas as paradas referentes a busca.

    public func buscarParadaPorCorredor(codigoCorredor: String, completion: @escaping ([Parada]?, NSError?) -> Void) {
        self.buscarParadaPorCorredor(codigoCorredor: codigoCorredor, completionHandler: { (paradasArray, error) in
            guard let paradasArray = paradasArray else { completion(nil, nil); return }
            var paradas = paradasArray.map {Parada($0)}
            completion(paradas, nil)
        })
        
    }
    
    /// Retorna um array [Corredor]? com todos os corredores inteligentes
    ///
    /// - Parameter completion: Callback com array [Corredor]? com todos os corredores inteligentes
    
    public func pegarCorredores(completion: @escaping ([Corredor]?, NSError?) -> Void) {
        self.pegarCorredores(completionHandler: { (corredoresArray, error) in
            guard let corredoresArray = corredoresArray else { completion(nil, nil); return }
            var corredores = corredoresArray.map {Corredor($0)}
            completion(corredores, nil)
        })
    }
    

    
    func pegarPosicaoOnibus(codigoLinha: String, completionHandler: @escaping RequestCompletion) {
        //genericGET("/Posicao?codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    func pegarTempoDeChegadaDeUmOnibusNaParada(codigoLinha: String, codigoParada: String, completionHandler: @escaping RequestCompletion) {
        //genericGET("/Previsao?codigoParada=" + codigoParada + "&codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    func pegarTemposDeChegadaParada(codigoParada: String, completionHandler: @escaping RequestCompletion) {
        //genericGET("/Previsao/Parada?codigoParada=" + codigoParada, completionHandler: completionHandler)
    }
    
    
    internal func genericGET(_ endpoint:String, completionHandler: @escaping ([[String:AnyObject]]?, NSError?) -> Void) {
        requester.sendRequest(method: .get, endpoint: endpoint, headers: [:], body: "") {
            (data, response, error) in
            
            guard let response = response,
                let data = data,
                let httpResponse:HTTPURLResponse = response as! HTTPURLResponse else {
                    completionHandler(nil, error as NSError?)
                    return
            }
            
            if httpResponse.statusCode != 200 {
                completionHandler(nil, error as NSError?)
                return
            }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String:AnyObject]]
                completionHandler(responseJSON, nil)
                return
            }
            catch let error as NSError {
                completionHandler(nil, error)
                return
            }
            
            completionHandler(nil, nil)
            return
        }
    }
    
    internal func athenticationURL(token:String) -> String {
        return "/Login/Autenticar?token=" + requester.token
    }
    
    internal func buscarDetalheLinha(termosBusca: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Linha/Buscar?termosBusca=" + termosBusca, completionHandler: completionHandler)
    }
    
    internal func carregarDetalhesLinha(codigoLinha: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Linha/CarregarDetalhes?codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    internal func buscarParada(termosBusca: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Parada/Buscar?termosBusca=" + termosBusca, completionHandler: completionHandler)
    }
    
    internal func buscarParadaPorLinha(codigoLinha: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Parada/BuscarParadasPorLinha?codigoLinha=" + codigoLinha, completionHandler: completionHandler)
    }
    
    internal func buscarParadaPorCorredor(codigoCorredor: String, completionHandler: @escaping RequestCompletion) {
        genericGET("/Parada/BuscarParadasPorCorredor?codigoCorredor=" + codigoCorredor, completionHandler: completionHandler)
    }
    
    internal func pegarCorredores(completionHandler: @escaping ([[String:AnyObject]]?, NSError?) -> Void) {
        genericGET("/Corredor", completionHandler: completionHandler)
    }
    

    
}
