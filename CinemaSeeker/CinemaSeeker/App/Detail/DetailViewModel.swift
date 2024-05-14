//
//  DetailViewModel.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    @Published var movieDetail: MovieDetail?
    @Published var similarMovies: [Movie] = []
    @Published var casts: [Casts] = []
    
    private var movieNetwork = MovieNetwork()
    
    //MARK: - getMovieDetail
    func getMovieDetail(withId movieId: Int){
        movieNetwork.fetchMovieDetail(withId: movieId) { result in
            switch result {
            case .success(let Movie):
                DispatchQueue.main.async {
                    self.movieDetail = Movie
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - getSimilarMovies
    func getSimilarMovies(withId movieId: Int) {
        movieNetwork.fetchSimilarList(withId: movieId) { result in
            switch result {
            case .success(let Movies):
                DispatchQueue.main.async {
                    self.similarMovies = Movies.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - getCasts
    func getCasts(withId movieId: Int) {
        movieNetwork.fetchCastList(withId: movieId) { result in
            switch result {
            case .success(let Casts):
                DispatchQueue.main.async {
                    self.casts = Casts.cast
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
