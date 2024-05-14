//
//  GenreViewModel.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import Foundation

class GenreViewModel: ObservableObject {
    @Published var moviesByGenre: [Movie] = []
    
    private var movieNetwork = MovieNetwork()
    
    //MARK: - getMoviesWithGenreId
    func getMoviesWithGenreId(withGenreId genreId: Int){
        movieNetwork.fetchWithGenreMovies(with: genreId) { result in
            switch result {
            case .success(let Movies):
                DispatchQueue.main.async {
                    self.moviesByGenre = Movies.results
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
