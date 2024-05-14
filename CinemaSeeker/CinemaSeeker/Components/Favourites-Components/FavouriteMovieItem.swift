//
//  FavouriteMovieItem.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct FavouriteMovieItem: View {
    var movie: FavouriteMovie
    var body: some View {
        HStack {
            ImageItem(imagePath:movie.imagePath)
                .clipShape(.rect(cornerRadius: 16))
                .frame(width: 170,height: 210)
                
            VStack(alignment:.leading,spacing: 30){
                Text(movie.title)
                    .font(.titleLarge)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.textBase)
                    .shadow(color: .black, radius: 4)
                    .lineLimit(2)
                HStack(spacing:10){
                    Text("You rated this movie")
                        .font(.buttonBase)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.textBase2)
                    Text(NSNumber(value: movie.voteRate),formatter: doubleFormatter)
                        .font(.titleLarge)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.star)
                }//:HSTACK
            }//:VSTACK
        }//:HSTACK
        .padding(.vertical,10)
        .padding(.horizontal,10)
    }
}

#Preview {
    FavouriteMovieItem(movie: sampleFavourite)
}
