//
//  GenreMovieList.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreMovieList: View {
    var movies: [Movie]
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                ForEach(movies,id:\.self) { movie in
                    GenreMovieItem(movie: movie)
                        .padding(.vertical,10)
                        .padding(.horizontal,10)
                }
            })
        }
    }
}

#Preview {
    GenreMovieList(movies: [sampleMovie,sampleMovie])
}
