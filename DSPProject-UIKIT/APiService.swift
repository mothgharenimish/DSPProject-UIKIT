//
//  APiService.swift
//  DSPProject-UIKIT
//
//  Created by Nimish Mothghare on 08/08/25.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func login(username: String, password: String, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        let url = "http://114.143.215.197:9000/dsp/login"
        
        let parameters: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .validate()
        .responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                completion(.success(json))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
