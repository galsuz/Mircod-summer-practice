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
    case registration(login: String,
                      password: String,
                      firstName: String,
                      lastName: String,
                      email: String)
    case logout(login: String, password: String)
    case getUser(token: String)
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
        case .logout:
            return "/logout"
        case .getUser:
            return "/login/"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .authorization:
            return .post
        case .registration:
            return .post
        case .logout:
            return .post
        case .getUser:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .authorization(let login, let password):
//            print("SwaggerEndPoint: login: \(login), password: \(password)")
            return .requestParameters(bodyParameters: [UserFields.username.rawValue:login,
                                                       UserFields.password.rawValue:password],
                                      urlParameters: nil)
        case .registration(let login, let password, let firstName, let lastName, let email):
//            print("SwaggerEndPoint: login: \(login), password: \(password)")
            return .requestParameters(bodyParameters: [UserFields.username.rawValue:login,
                                                       UserFields.password.rawValue:password,
                                                       UserFields.firstName.rawValue: firstName,
                                                       UserFields.lastName.rawValue: lastName,
                                                       UserFields.email.rawValue: email],
                                      urlParameters: nil)
        case .logout(let login, let password):
            return .requestParameters(bodyParameters: [UserFields.username.rawValue:login,
                                                       UserFields.password.rawValue:password],
                                      urlParameters: nil)
        case .getUser(let token):
            return .requestParameters(bodyParameters: [UserFields.token.rawValue:token],
                                      urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}

enum UserFields: String {
    case token = "token"
    case username = "username"
    case password = "password"
    case firstName = "first_name"
    case lastName = "last_name"
    case email = "email"
}
