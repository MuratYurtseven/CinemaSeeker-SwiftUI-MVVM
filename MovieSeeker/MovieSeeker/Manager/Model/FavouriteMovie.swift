//
//  FavouriteMovie.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation

struct FavouriteMovie:Codable,Hashable{
    let id: Int
    let title: String
    let imagePath: String
    var voteRate: Double
}
