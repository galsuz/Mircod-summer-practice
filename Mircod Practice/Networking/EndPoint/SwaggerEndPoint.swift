//
//  SwaggerEndPoint.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 05.07.2021.
//

import Foundation

enum NetworkEnviroment {
    case debug
    case staging
    case production
}

public enum ConnectionAPI {
    case authorization(login: String, password: String)
    case registration(login: String, password: String)
}

extension ConnectionAPI: EndPointType {
    
    var enviromentBaseURL: String {
        switch NetworkManager.enviroment {
        case .debug:
            return "https://tools.mircod.one/api"
        case .staging:
            return "https://tools.mircod.one/api"
        case .production:
            return "https://tools.mircod.one/api"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: enviromentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .authorization:
            return "/login/"
        case .registration:
            return "/registration/"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
        case .authorization(let login, let password):
            print("SwaggerEndPoint: login: \(login), password: \(password)")
            return .requestParameters(bodyParameters: ["username":login, "password":password],
                                      urlParameters: nil)
        case .registration(let login, let password):
            print("SwaggerEndPoint: login: \(login), password: \(password)")
            return .requestParameters(bodyParameters: ["username":login, "password":password],
                                      urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
