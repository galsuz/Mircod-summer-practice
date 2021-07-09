//
//  NetworkManager.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 05.07.2021.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."

}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    static let enviroment: NetworkEnviroment = .debug
    private let router = Router<ConnectionAPI>()
    
    func postUserLogin(login: String,
                      password: String,
                      completion: @escaping (_ userLoginResponse: UserLoginResponse?,_ error: String?) ->()){
        router.request(.authorization(login: login, password: password)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your connection")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try? JSONDecoder().decode(UserLoginResponse.self, from: responseData)
                        print("api response: \(apiResponse)")
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func postUserRegistration(login: String,
                      password: String,
                      firstName: String = "",
                      lastName: String = "",
                      email: String = "",
                      completion: @escaping (_ userLoginResponse: Int?,_ error: String?) ->()){
        router.request(.registration(login: login,
                                     password: password,
                                     firstName: firstName,
                                     lastName: lastName,
                                     email: email)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your connection")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    completion(response.statusCode, nil)
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func postUserLogout(login: String,
                      password: String,
                      completion: @escaping (_ userLoginResponse: Int?,_ error: String?) ->()){
        router.request(.logout(login: login, password: password)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your connection")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    completion(response.statusCode, nil)
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getUserForToken(token: String,
                         completion: @escaping (_ UserLoginResponse: Int?,_ error: String?) ->()){
        router.request(.getUser(token: token)) { data, response, error in
            if error != nil {
                completion(nil, "Wrong token")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    print(data)
                    completion(response.statusCode, nil)
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
                
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        
        switch response.statusCode {
                case 200...299: return .success
                case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
                case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
                case 600: return .failure(NetworkResponse.outdated.rawValue)
                default: return .failure(NetworkResponse.failed.rawValue)
                }
    }
}



