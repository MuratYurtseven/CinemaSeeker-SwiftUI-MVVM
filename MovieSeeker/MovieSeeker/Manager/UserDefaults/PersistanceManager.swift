//
//  PersistanceManager.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation

enum PersistanceActionType{
    case add, remove
}

struct PersistanceManager{
    
    enum Keys:String{
        case watchlist = "watchlist"
        case favourite = "favouritelist"
    }
    
    static func getFavouriteMovies(completion:@escaping(Result<[FavouriteMovie],CSError>) -> Void){
        Persistance.retieveMovies(key: Keys.favourite.rawValue, completion: completion)
    }
    
    static func getWatchListMovies(completion:@escaping(Result<[WatchListMovie],CSError>) -> Void){
        Persistance.retieveMovies(key: Keys.watchlist.rawValue, completion: completion)
    }
    
    static func updateFavouritesWith(movie: FavouriteMovie,actionType:PersistanceActionType,completion:@escaping(CSError?) -> Void){
        
        Persistance.retieveMovies(key: Keys.favourite.rawValue) { (result: Result<[FavouriteMovie], CSError>) in
            switch result {
            case .success(let Movies):
                var retievedMovies = Movies
                switch actionType {
                case .add:
                    guard !retievedMovies.contains(where: {$0.id == movie.id}) else {
                        completion(.alreadyInFavorites)
                        return
                    }
                    retievedMovies.append(movie)
                case .remove:
                    retievedMovies.removeAll{
                        $0.id == movie.id
                    }
                }
                completion(Persistance.save(key: Keys.favourite.rawValue, saveData: retievedMovies))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    
    static func updateWatchListWith(movie: WatchListMovie,actionType:PersistanceActionType,completion:@escaping(CSError?) -> Void){
        
        Persistance.retieveMovies(key: Keys.watchlist.rawValue) { (result: Result<[WatchListMovie], CSError>) in
            switch result {
            case .success(let Movies):
                var retievedMovies = Movies
                switch actionType {
                case .add:
                    guard !retievedMovies.contains(where: {$0.id == movie.id}) else {
                        completion(.alreadyInWatchList)
                        return
                    }
                    retievedMovies.append(movie)
                case .remove:
                    retievedMovies.removeAll{
                        $0.id == movie.id
                    }
                }
                completion(Persistance.save(key: Keys.watchlist.rawValue, saveData: retievedMovies))
            case .failure(let error):
                completion(error)
            }
        }
    }
}
