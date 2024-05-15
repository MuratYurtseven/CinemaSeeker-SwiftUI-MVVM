//
//  WatchListMovie.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import Foundation

struct WatchListMovie:Codable ,Hashable{
    let id : Int
    let title: String
    let imagePath: String
    let tagline: String
    var addedTime =  Date()
    
}
