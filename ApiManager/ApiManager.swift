//
//  ApiManager.swift
//  ApiManager
//
//  Created by Evgen on 13.01.2023.
//

import Foundation
import Contracts

public class ApiManager {
    
    public static let shared = ApiManager()
    
    public func fetchData(completion: @escaping ([UserModel]) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api/?page=3&results=10&seed=abc") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, e) in
            
            guard let data = data, e == nil else {
                completion([])
                return
            }
            //print(String(data: data, encoding: .utf8 ))
            
//            do {
//                let result = try JSONDecoder().decode(RawResponse.self, from: data)
//                print(result)
//            }
//            catch let error {
//                print(error.localizedDescription)
//            }
        
            
            
            guard let result: Response  = try? JSONDecoder().decode(Response.self, from: data) else {
                completion([])
                return
            }
            DispatchQueue.main.async {
                completion(result.users)
            }
        }
        task.resume()
    }
    
}
