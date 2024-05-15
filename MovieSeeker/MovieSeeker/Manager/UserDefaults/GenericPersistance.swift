//
//  GenericPersistance.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation


struct Persistance {
    
    static private let defaults = UserDefaults.standard
    
    static func retieveMovies<T:Codable>(key:String,completion:@escaping(Result<[T],CSError>) -> Void){
        guard let data = defaults.object(forKey: key) as? Data else {
            completion(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let dataList = try decoder.decode([T].self, from: data)
            completion(.success(dataList))
        } catch {
            completion(.failure(.unableToComplete))
        }
    }
    
    static func save<T:Codable>(key:String,saveData: [T]) -> CSError? {
        
        do {
            let encoder = JSONEncoder()
            let encoderData = try encoder.encode(saveData)
            defaults.set(encoderData, forKey: key)
            return nil
        } catch {
            return .unableToComplete
        }
    }
}
