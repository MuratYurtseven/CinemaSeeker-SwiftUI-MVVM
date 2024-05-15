//
//  HomeViewModel.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    //MARK: - PROPERTIES
    @Published var genres: [Genre] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var nowPlayingMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    
    private var movieNetwork = MovieNetwork()
    
    init() {
        self.getGenres()
        self.getTopRatedMovies()
        self.getNowPlayingMovies()
        self.getPopularMovies()
        self.getUpcomingMovies()
    }
    
    
    //MARK: - FUNCTIONS
    
    //MARK: - getGenres
    func getGenres() {
        movieNetwork.fetchMovieGenreList { result in
            switch result {
            case .success(let Genres):
                DispatchQueue.main.async {
                    self.genres = Genres.genres
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - getTopRatedMovies
    func getTopRatedMovies() {
        movieNetwork.fetchTopRatedList { result in
            switch result {
            case .success(let Movies):
                DispatchQueue.main.async {
                    self.topRatedMovies = Movies.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    //MARK: - getNowPlayingMovies
    func getNowPlayingMovies() {
        movieNetwork.fetchNowPlayingList { result in
            switch result {
            case .success(let Movies):
                DispatchQueue.main.async {
                    self.nowPlayingMovies = Movies.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    //MARK: - getPopularMovies
    func getPopularMovies() {
        movieNetwork.fetchPopularList { resutl in
            switch resutl {
            case .success(let Movies):
                DispatchQueue.main.async{
                    self.popularMovies = Movies.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    //MARK: - getUpcomingMovies
    func getUpcomingMovies() {
        movieNetwork.fetchUpcomingList { result in
            switch result {
            case .success(let Movies):
                DispatchQueue.main.async {
                    self.upcomingMovies = Movies.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
