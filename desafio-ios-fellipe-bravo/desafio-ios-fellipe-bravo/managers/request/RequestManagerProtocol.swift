//
//  RequestManagerProtocol.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

protocol RequestManagerProtocol {
    func doRequest(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]?, encoding: ParameterEncoding, headers: [String: String]?) -> Observable<(HTTPURLResponse, Any)>
}
