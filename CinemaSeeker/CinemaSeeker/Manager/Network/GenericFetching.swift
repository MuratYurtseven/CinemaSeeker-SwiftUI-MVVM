//
//  GenericFetching.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation

struct Fetching {
    
    private static let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    
    static func getData<T:Codable>(withRequest url: URLRequest,completion: @escaping(Result<T,CSError>) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            
            if let anyError = error {
                print(anyError.localizedDescription)
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse ,(200...299).contains(response.statusCode) else {
                print("Error in response")
                completion(.failure(.invailedResponse))
                return
            }
            
            guard let data = data else {
                print("Error in data")
                completion(.failure(.invailedData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch (let error) {
                print("Cache error \(error.localizedDescription)")
                completion(.failure(.invailedData))
            }
        }
        task.resume()
        
    }
    
}
