//
//  SearchMovieItem.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct SearchMovieItem: View {
    var movie: Movie
    @State var isAnimating = false
    var body: some View {
        VStack {
            if let imagePath = movie.poster_path,
               let id = movie.id,
               let title = movie.title,
               let voteAverage = movie.vote_average,
               let releaseDate = movie.release_date {
                
                HStack(spacing:30){
                    ImageItem(imagePath: imagePath,movieId: id)
                        .frame(width: 140,height: 200)
                        .clipShape(.rect(cornerRadius: 16))
                        .scaleEffect(isAnimating ? 1 : 0.7)
                        .opacity(isAnimating ? 1 : 0.7)
                    
                    VStack(alignment: .leading,spacing: 25){
                        Text(title)
                            .font(.titleLarge)
                            .fontWeight(.bold)
                        VStack(alignment: .leading,spacing: 10) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .font(.detailBase)
                                Text(NSNumber(value: voteAverage),formatter: doubleFormatter)
                                    .font(.detailBase)
                            }//:HSTACK
                            .foregroundStyle(Color.star)
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .font(.detailBase)
                                Text(releaseDate)
                                    .font(.detailBase)
                                    
                            }//:HSTACK
                            .foregroundStyle(Color.textBase)
                        }//:VSTACK
                    }//:VSTACK
                }//:HSTACK
            }
        }//:VSTACK
        .padding(.horizontal,10)
        .onAppear(perform: {
            withAnimation(.linear(duration: 1)){
                isAnimating = true}
        })
    }
}

#Preview {
    SearchMovieItem(movie: sampleMovie)
}
