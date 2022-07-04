//
//  APIManager.swift
//  mBank
//
//  Created by Tornike Bardadze on 02.07.22.
//

import Foundation
import Alamofire

enum APIErrors: Error {
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void

class APIManager {
    static let shareInstance = APIManager()
    
    func callingRegisterAPI(register: RegisterModel, completionHandler: @escaping (Bool) ->()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(register_url,
                   method: .post,
                   parameters: register,
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(true)
                    } else {
                        completionHandler(false)
                    }
                } catch {
                    print(error.localizedDescription)
                    completionHandler(false)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false)
            }
        }
    }
    
    func callingLoginAPI(login: LoginModel, completionHandler: @escaping Handler) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(login_url,
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(.success(json))
                    } else {
                        completionHandler(.failure(.custom(message: "Please check your network connection")))
                    }
                } catch {
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "Please try again")))
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(.failure(.custom(message: "Please try again")))
            }
        }
    }
    
    
}
