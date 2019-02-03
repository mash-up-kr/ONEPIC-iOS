//
//  NetworkProvider.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 03/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import Foundation
import Moya

struct NetworkProvider {
    static func request(target: Service, completion: @escaping (Data?, Error?) -> Void) {
        let provider = MoyaProvider<Service>()

        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                completion(moyaResponse.data, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
}
