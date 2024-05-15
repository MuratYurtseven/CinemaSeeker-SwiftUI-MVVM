//
//  GenreView.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreView: View {
    @StateObject var viewModel = GenreViewModel()
    var genre: Genre
    var body: some View {
        VStack (alignment: .leading){
            GenreNavigationView()
            if let name = genre.name{
                TitleView(title: name)
                    .padding(.horizontal,10)
            }

            ScrollView(.vertical,showsIndicators: false){
                GenreMovieList(movies: viewModel.moviesByGenre)
            }
        }
        .task {
            if let genreId = genre.id{
                self.viewModel.getMoviesWithGenreId(withGenreId: genreId)
            }
        }
        
        .background(BackgroundStyle.background)
    }
}

#Preview {
    GenreView(genre: sampleGenre)
        .environmentObject(ChangePage())
}
