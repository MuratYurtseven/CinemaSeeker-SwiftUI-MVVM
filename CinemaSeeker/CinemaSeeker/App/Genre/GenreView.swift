//
//  GenreView.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreView: View {
    @StateObject var viewModel = GenreViewModel()
    var genreId:Int
    var body: some View {
        VStack {
            GenreNavigationView()
            ScrollView(.vertical,showsIndicators: false){
                GenreMovieList(movies: viewModel.moviesByGenre)
            }
        }
        .task {
            self.viewModel.getMoviesWithGenreId(withGenreId: genreId)}
        
        .background(BackgroundStyle.background)
    }
}

#Preview {
    GenreView(genreId: 37)
        .environmentObject(ChangePage())
}
