//
//  FavouritesViewModel.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation
class FavouritesViewModel: ObservableObject {
    @Published var favouritesMovies:[FavouriteMovie] = []
        
    init(){
        self.getFavouriteMovies()
    }
    func getFavouriteMovies(){
        PersistanceManager.getFavouriteMovies { result in
            switch result {
            case .success(let Movies):
                self.favouritesMovies = Movies
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
