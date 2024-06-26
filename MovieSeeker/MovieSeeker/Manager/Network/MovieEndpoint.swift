//
//  MovieEndpoint.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation

enum MovieEndpoint {
    
    case MovieGenreList
    case Popular
    case TopRated
    case Upcoming
    case nowPlaying
    case MovieWithGenre
    case searchMovie
    case Details(movieId: String)
    case Credits(movieId: String)
    case Similar(movieId: String)
    case Images(imagePath: String)
    
    var rawValue: String {
        switch self {
        case .MovieGenreList: return "genre/movie/list"
        case .Popular: return "movie/popular"
        case .TopRated: return "movie/top_rated"
        case .Upcoming: return "movie/upcoming"
        case .nowPlaying: return "movie/now_playing"
        case .MovieWithGenre: return "discover/movie"
        case .searchMovie: return "search/movie"
        case .Details(let movieId): return "movie/\(movieId)"
        case .Credits(let movieId): return "movie/\(movieId)/credits"//Cast
        case .Similar(let movieId): return "movie/\(movieId)/similar"
        case .Images(let imagePath): return "t/p/w500/\(imagePath)"
        }
    }
}
