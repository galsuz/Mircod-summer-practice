//
//  UserModel.swift
//  Mircod Practice
//
//  Created by Павел Прокопьев on 05.07.2021.
//

import Foundation

struct UserLoginResponse {
    public let token: String
    public let userData: UserData
}

extension UserLoginResponse: Decodable {
    
    private enum UserLoginResponseCodingKeys: String, CodingKey {
        case token
        case userData = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: UserLoginResponseCodingKeys.self)
        token = try container!.decode(String.self, forKey: .token)
        userData = try container!.decode(UserData.self, forKey: .userData)
    }
    
}

struct UserData {
    public let username: String
    public let firstName: String?
    public let lastName: String?
    public let password: String
    public let email: String?
}

extension UserData: Decodable {
    
    private enum UserDataCodingKeys: String, CodingKey {
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case password
        case email
    }
    
    init(from decoder: Decoder) throws {
        let userContainer = try? decoder.container(keyedBy: UserDataCodingKeys.self)
        print("User model: key username - \(UserDataCodingKeys.username)")
        username = try userContainer!.decode(String.self, forKey: .username)
        firstName = try userContainer?.decode(String.self, forKey: .firstName)
        lastName = try userContainer?.decode(String.self, forKey: .lastName)
        password = try userContainer!.decode(String.self, forKey: .password)
        email = try userContainer?.decode(String.self, forKey: .email)
    }
}
