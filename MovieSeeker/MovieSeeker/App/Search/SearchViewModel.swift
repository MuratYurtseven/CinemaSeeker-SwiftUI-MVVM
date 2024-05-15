//
//  SearchViewModel.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchedMovies: [Movie] = []
    
    private var movieNetwork = MovieNetwork()
    
    //MARK: - getMovies
    func getMovies(query movieTitle:String){
        self.searchedMovies.removeAll()
        movieNetwork.fetchMovieSearch(query: movieTitle) { result in
            switch result {
            case .success(let Movies):
                DispatchQueue.main.async {
                    self.searchedMovies = Movies.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
