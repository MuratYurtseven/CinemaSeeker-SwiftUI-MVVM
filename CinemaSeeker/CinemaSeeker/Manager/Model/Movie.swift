//
//  Movie.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation
struct Movie: Codable ,Hashable{
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let id: Int?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let video: Bool?
    let vote_average: Double?
    let vote_count: Int?

}

