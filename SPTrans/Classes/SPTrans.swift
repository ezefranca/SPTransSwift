//
//  SPTrans.swift
//  SPTransDemo
//
//  Created by Ezequiel on 6/4/16.
//  Copyright © 2016 Ezequiel França @ezefranca. All rights reserved.
//

import Foundation
import Alamofire

class SPTrans {
    
    func authentication(){
        
        setupEndpointsAndToken()
        
        Alamofire.request(.POST, BASE_URL_SPTRANS + "/Login/Autenticar?token=" + TOKEN)
            .response { response in
                print(response)  // original URL request
        }
    }
    
    // buscarDetalheLinha
    func searchBusLineDetail(searchQuery: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        genericGET(SEARCHBUSLINEDETAIL + searchQuery, completionHandler: completionHandler)
    }
    
    // carregarDetalhesLinha
    func loadBusLineDetails(busLineCode: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        genericGET(LOADBUSLINEDETAILS + codigoLinha, completionHandler: completionHandler)
    }
    
    // buscarParada
    func searchBusStop(searchQuery: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        genericGET(SEARCHBUSSTOP + searchQuery, completionHandler: completionHandler)
    }
    
    // buscarParadaPorLinha
    func searchBusStopByBusLine(busLineCode: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        genericGET(SEARCHBUSSTOPBYBUSLINE + codigoLinha, completionHandler: completionHandler)
    }
    
    // pegarPosicaoOnibus
    func getBusPosition(busLineCode: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        genericGET(GETBUSPOSITION + busLineCode, completionHandler: completionHandler)
    }
    
    // pegarTempoDeChegadaDeUmOnibusNaParada
    func getArrivalTimeBusInABusStop(busLineCode: String, busStopCode: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        genericGET(GETARRIVALTIMEBUSINABUSSTOP + busStopCode + "&codigoLinha=" + busLineCode, completionHandler: completionHandler)
    }
    
    // pegarTemposDeChegadaParada
    func getArrivalTimesBusStop(busStopCode: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        genericGET(GETARRIVALTIMEBUSSTOP + busStopCode, completionHandler: completionHandler)
    }
}


extension SPTrans {
    
    var BASE_URL_SPTRANS = ""
    var TOKEN = "cfd03d518181527ab8211864f0a436a705118b731569502a6420b7c0228daa4d"
    var LOGIN = ""
    var SEARCHBUSLINEDETAIL = ""
    var LOADBUSLINEDETAILS = ""
    var SEARCHBUSSTOP = ""
    var SEARCHBUSSTOPBYBUSLINE = ""
    var GETBUSPOSITION = ""
    var GETARRIVALTIMEBUSINABUSSTOP = ""
    var GETARRIVALTIMEBUSSTOP = ""
    
    func setupEndpointsAndToken() {
        
        SPTransHelper.sharedInstance.start()
        let s = SPTransHelper.sharedInstance
        
        BASE_URL_SPTRANS = s.getValueForKey("BASE_URL")
        TOKEN = s.getValueForKey("TOKEN")
        LOGIN = s.getValueForKey("LOGIN")
        SEARCHBUSLINEDETAIL = s.getValueForKey("searchBusLineDetail")
        LOADBUSLINEDETAILS = s.getValueForKey("loadBusLineDetails")
        SEARCHBUSSTOP = s.getValueForKey("searchBusStop")
        SEARCHBUSSTOPBYBUSLINE = s.getValueForKey("searchBusStopByBusLine")
        GETBUSPOSITION = s.getValueForKey("getBusPosition")
        GETARRIVALTIMEBUSINABUSSTOP = s.getValueForKey("getArrivalTimeBusInABusStop")
        GETARRIVALTIMEBUSINABUSSTOP = s.getValueForKey("getArrivalTimesBusStop")
        
    }
    
    func genericGET(url: String, completionHandler: (AnyObject?, NSError?) -> ()) {
        
        Alamofire.request(.GET, BASE_URL_SPTRANS + url)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    print(value)
                    completionHandler(value as? AnyObject, nil)
                case .Failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
}



