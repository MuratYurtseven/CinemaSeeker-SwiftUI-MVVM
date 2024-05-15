//
//  ChangePage.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import Foundation

class ChangePage: ObservableObject {
    @Published var showingHomeView: Bool = true
    @Published var showingSearchView: Bool = true
    
    @Published var showingDetailView: Bool = false
    @Published var selecetedMovieId: Int? = nil
    
    @Published var showingGenreView: Bool = false
    @Published var selecetedGenreId: Int? = nil
    
}
