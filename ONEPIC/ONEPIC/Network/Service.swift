//
//  Service.swift
//  ONEPIC
//
//  Created by Daeyun Ethan on 03/02/2019.
//  Copyright © 2019 Mash-Up. All rights reserved.
//

import Foundation
import Moya

enum Service {
    enum Method {
        case get
        case post
        case put
        case delete
    }

    case user(method: Method)
    case signIn(method: Method)
    case books(method: Method)
    case likes(method: Method)
    case alerts(method: Method)
    case keeps(method: Method)
    case parts(method: Method)
    case toasts(method: Method)
    case questions(method: Method)
    case main(method: Method)
}

extension Service: TargetType {
    var baseURL: URL {
        let urlString = "http://13.113.246.46:3000/"
        guard let url = URL(string: urlString) else {
            assertionFailure("\(urlString) doesn't exist!")
            return URL(string: "")!
        }
        return url
    }

    var path: String {
        switch self {
        case .user:
            return "user"
        case .signIn:
            return "signIn"
        case .books:
            return "books"
        case .likes:
            return "likes"
        case .alerts:
            return "alerts"
        case .keeps:
            return "keeps"
        case .parts:
            return "parts"
        case .toasts:
            return "toasts"
        case .questions:
            return "questions"
        case .main:
            return "main"
        }
    }

    var method: Moya.Method {
        switch self {
        // FIXME: 간소화 체크.
        case .user(let method), .signIn(let method), .books(let method), .likes(let method), .alerts(let method), .keeps(let method), .parts(let method), .toasts(let method), .questions(let method), .main(let method):
            switch method {
            case .get:
                return .get
            case .post:
                return .post
            case .put:
                return .put
            case .delete:
                return .delete
            }
        }
    }

    var sampleData: Data {
        return Data()
    }

    // TODO: 해당 부분 작업 할 때, API Document 보고 업데이트 시킬 것.
    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
