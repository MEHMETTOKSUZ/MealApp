//
//  WebService.swift
//  MealApp
//
//  Created by Mehmet ÖKSÜZ on 18.03.2024.
//

import Foundation

struct WebService {
    
   static let shared = WebService()
    private init() {}
    
    func fetchData<T: Codable>(from url: URL, completion: @escaping (Result<T,Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                completion(.success(results))
            } catch let error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
        
    }
    
}
