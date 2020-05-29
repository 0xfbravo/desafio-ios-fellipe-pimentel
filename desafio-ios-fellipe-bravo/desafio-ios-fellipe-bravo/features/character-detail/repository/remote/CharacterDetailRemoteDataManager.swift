//
//  RemoteRepositoryManager.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 29/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class CharacterDetailRemoteDataManager {
    
    private let requestManager: RequestManagerProtocol
    private let decoder: JSONDecoder
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         decoder: JSONDecoder = JSONDecoder()) {
        self.requestManager = requestManager
        self.decoder = decoder
    }
    
}

// MARK: - Protocol
extension CharacterDetailRemoteDataManager: CharacterDetailRemoteDataManagerProtocol {
    
}
