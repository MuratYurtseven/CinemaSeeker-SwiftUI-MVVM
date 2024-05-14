//
//  GenreMovieItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreMovieItem: View {
    var movie: Movie
    var body: some View {
        ZStack {
            GenreItemBackground()
            VStack {
                if let imagePath = movie.poster_path,let id = movie.id,let title = movie.title{
                    ImageItem(imagePath: imagePath, movieId: id)
                        .frame(width: 145,height: 220)
                        .clipShape(.rect(cornerRadius: 16))
                        .shadow(color: .black,radius: 3)
                        .padding(.vertical,5)
                        .padding(.horizontal,10)
                    
                    Text(title)
                        .font(.buttonBase)
                        .fontWeight(.black)
                        .lineLimit(2)
                        .foregroundStyle(Color.textBase)
                        .shadow(color: .black, radius: 1)
                        .padding(.horizontal,10)
                }//:CONDITION
            }//:VSTACK
            .padding(.horizontal,5)
            .padding(.vertical,15)
        }//:ZSTACK
        .frame(width: 150,height: 300)
    }
}

#Preview {
    GenreMovieItem(movie: sampleMovie)
}
