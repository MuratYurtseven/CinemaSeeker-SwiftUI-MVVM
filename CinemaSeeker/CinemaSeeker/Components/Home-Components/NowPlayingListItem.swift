//
//  NowPlayingListItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct NowPlayingListItem: View {
    //MARK: - PROPERTIES
    var movie: Movie
    //MARK: - BODY
    var body: some View {
        HStack(spacing:15) {
            if let imagePath = movie.backdrop_path,let title = movie.title,let voteAverage = movie.vote_average,let releaseDate = movie.release_date,let movieId = movie.id{
                ImageItem(imagePath: imagePath, movieId: movieId)
                    .scaledToFit()
                    .frame(width: 175,height: 100)
                    .clipShape(.rect(cornerRadius: 16))
                
                VStack (alignment:.leading,spacing: 10){
                    //MARK: - TITLE
                    Text(title)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .font(.titleLitle)
                        .foregroundStyle(Color.textBase)

                    
                    //MARK: - VOTEAVERAGE
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.star)
                        
                        Text(NSNumber(value: voteAverage),formatter: doubleFormatter)
                            .font(.detailBase)
                            .foregroundStyle(Color.star)

                    }//:HSTACK
                    
                    //MARK: - GENRE
                   /* HStack {
                        Image(systemName: "ticket")
                            .foregroundStyle(Color.text)
                        if let genre = vm.findGenreNameWithGenreId(withGenreId: genres[0]){
                            Text(genre)
                                .font(.detailBase)
                                .foregroundStyle(Color.textBase)
                        }
                        
                    }//:HSTACK
                    */
                    //MARK: - RDate
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundStyle(Color.textBase)
                        
                        Text(releaseDate)
                            .font(.detailBase)
                            .foregroundStyle(Color.textBase)
                    }
                    
                }//:VSTACK
            }//:CONDITION
            Spacer()
        }//:HSTACK
        .frame(maxWidth: 350)
        .padding(.horizontal,10)
        .padding(.vertical,10)
    }
}

#Preview {
    NowPlayingListItem(movie: sampleMovie)
}
