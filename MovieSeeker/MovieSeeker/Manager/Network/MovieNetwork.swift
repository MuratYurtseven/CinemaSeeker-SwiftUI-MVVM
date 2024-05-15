//
//  MovieNetwork.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation
class MovieNetwork {
    static let shared = MovieNetwork()
    
    func fetchMovieGenreList(completion: @escaping(Result<Genres,CSError>) -> Void){
        let url = MovieAPI.movieGenreListUrl
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchPopularList(completion: @escaping(Result<Movies,CSError>) -> Void) {
        let url = MovieAPI.popularListUrl
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchTopRatedList(completion:@escaping(Result<Movies,CSError>) -> Void){
        let url = MovieAPI.topRatdListUrl
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchUpcomingList(completion: @escaping(Result<Movies,CSError>) -> Void) {
        let url = MovieAPI.upcomingListUrl
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchNowPlayingList(completion: @escaping(Result<Movies,CSError>) -> Void) {
        let url = MovieAPI.nowPlayinListUrl
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchWithGenreMovies(with genreId: Int,completion:@escaping(Result<Movies,CSError>) -> Void){
        let url = MovieAPI.moviesWithGenreUrl(withGenre: "\(genreId)")
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchMovieSearch(query:String,completion: @escaping(Result<Movies,CSError>) -> Void){
        let url = MovieAPI.movieSearchUrl(withQuery: query)
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchMovieDetail(withId movieId: Int,completion: @escaping(Result<MovieDetail,CSError>) -> Void){
        let url = MovieAPI.movieDetailUrl(withId: "\(movieId)")
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchCastList(withId movieId: Int,completion: @escaping(Result<Credit,CSError>) -> Void) {
        let url = MovieAPI.creditsUrl(withId: "\(movieId)")
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
    func fetchSimilarList(withId movieId: Int,completion: @escaping(Result<Movies,CSError>) -> Void ) {
        let url = MovieAPI.similar(withId: "\(movieId)")
        let request = URLRequest(url: url)
        Fetching.getData(withRequest: request, completion: completion)
    }
    
}
