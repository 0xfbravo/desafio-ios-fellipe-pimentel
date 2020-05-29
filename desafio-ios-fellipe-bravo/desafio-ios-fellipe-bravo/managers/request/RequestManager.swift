//
//  RequestManager.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

final class RequestManager {
    
}

extension RequestManager: RequestManagerProtocol {
    
    func doRequest(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, Any)> {
        return requestJSON(method, url, parameters: parameters, encoding: encoding, headers: headers).debug()
    }
    
}
