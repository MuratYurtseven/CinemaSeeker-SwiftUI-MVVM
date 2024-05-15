//
//  WatchListViewModel.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation
class WatchListViewModel: ObservableObject {
    @Published var watchlistMovies:[WatchListMovie] = []
        
    init(){
        self.getWatchListMovies()
    }
    func getWatchListMovies(){
        PersistanceManager.getWatchListMovies { result in
            switch result {
            case .success(let Movies):
                DispatchQueue.main.async {
                    self.watchlistMovies = Movies
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
