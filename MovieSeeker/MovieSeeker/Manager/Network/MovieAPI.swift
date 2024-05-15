//
//  MovieAPI.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation

struct MovieAPI {
    
    private static let baseMovieURLString = "https://api.themoviedb.org/3/"
    private static let baseImageURLString = "https://image.tmdb.org/t/p/w500/"
    private static let apiKey = "0d43b3dc2ab476f291be4eee9902c4e2"
    
    private static func movieURL(endpoint: MovieEndpoint,parameters: [String:String]?) -> URL {
        
        var components = URLComponents(string: baseMovieURLString+endpoint.rawValue)!
        
        var queryItems: [URLQueryItem] = []
        
        let baseParams: [String:String] = [
            "api_key":apiKey
        ]
        
        for(key,value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let aditionalParameters = parameters {
            for (key,value) in aditionalParameters {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
    
    private static func imageURL(endpoint: MovieEndpoint,parameters: [String:String]?) -> URL {
        
        var components = URLComponents(string: baseImageURLString+endpoint.rawValue)!
        
        var queryItems: [URLQueryItem] = []
        
        let baseParams: [String:String] = [
            "api_key":apiKey
        ]
        
        for (key,value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let aditionalParameters = parameters {
            for (key,value) in aditionalParameters {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
    
    static var movieGenreListUrl: URL {
        return movieURL(endpoint: .MovieGenreList, parameters: nil)
    }
    
    static var popularListUrl: URL {
        return movieURL(endpoint: .Popular, parameters: nil)
    }
    
    static var topRatdListUrl: URL {
        return movieURL(endpoint: .TopRated, parameters: nil)
    }
    
    static var upcomingListUrl: URL {
        return movieURL(endpoint: .Upcoming, parameters: nil)
    }
    
    static var nowPlayinListUrl: URL {
        return movieURL(endpoint: .nowPlaying, parameters: ["release_date.lte":"2024-05-08","release_date.gte":"2024-04-08"])
    }
    
    static func moviesWithGenreUrl(withGenre genre:String) -> URL {
        return movieURL(endpoint: .MovieWithGenre, parameters: ["with_genres" : genre])
    }
    
    static func movieSearchUrl(withQuery query:String) -> URL {
        return movieURL(endpoint: .searchMovie, parameters: ["query" : query])
    }
    
    static func movieDetailUrl(withId movieId:String) -> URL {
        return movieURL(endpoint: .Details(movieId: movieId), parameters: nil)
    }
    
    static func creditsUrl(withId movieId:String) -> URL {
        return movieURL(endpoint: .Credits(movieId: movieId), parameters: nil)
    }
    
    static func similar(withId movieId: String) -> URL {
        return movieURL(endpoint: .Similar(movieId: movieId), parameters: nil)
    }
    
    static func image(imagePath: String) -> URL {
        return imageURL(endpoint: .Images(imagePath: imagePath), parameters: nil)
    }
    
}
