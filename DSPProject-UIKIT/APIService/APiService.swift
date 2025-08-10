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
    
    
    func signup(name: String, email: String,companyname:String,phonenumber : String,countrycode : String,password: String, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        let url = "http://114.143.215.197:9000/dsp/signUp"
        
        // 🔹 CHANGED: Wrapped in "dspDetails"
            let parameters: [String: Any] = [
                "dspDetails": [
                    "name": name,
                    "email": email,
                    "company_name": companyname,
                    "phone": phonenumber,
                    "country_code": countrycode,
                    "password": password
                ]
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
    
    func OtpsendbyEmail(email: String, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        let url = "http://114.143.215.197:9000/dsp/sendVerificationOtp/signUp"
        
        let parameters: [String: Any] = [
            "email": email,
            
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
    
    
    func OtpverifydbyEmail(email: String,otp: String, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        let url = "http://114.143.215.197:9000/dsp/verify/dspSignUpOtp"
        
        let parameters: [String: Any] = [
            "email": email,
            "otp" : otp
            
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
    
    
    func OtpsendbyMobile(mobile: String, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        let url = "http://114.143.215.197:9000/dsp/sendVerificationOtp/signUp"
        
        let parameters: [String: Any] = [
            "mobile": mobile,
            
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
    
    func OtpverifydbyMobile(mobile: String,otp: String, completion: @escaping (Result<JSON, Error>) -> Void) {
        
        let url = "http://114.143.215.197:9000/dsp/verify/dspSignUpOtp"
        
        let parameters: [String: Any] = [
            "mobile": mobile,
            "otp" : otp
            
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
