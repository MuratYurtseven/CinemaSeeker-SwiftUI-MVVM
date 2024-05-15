//
//  Movies.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import Foundation
struct Movies: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int?
    let total_results: Int?


}
