//
//  Frontdrop.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct Frontdrop: View {
    var movie: MovieDetail
    var body: some View {
        VStack{
            HStack(spacing:5){
                if let imagePath = movie.poster_path,let title = movie.title {
                    ImageItem(imagePath: imagePath)
                        .clipShape(.rect(cornerRadius: 16))
                        .frame(width: 140,height: 180)
                    
                    Text(title)
                        .font(.titleMedium)
                        .fontWeight(.heavy)
                        .lineLimit(2)
                        .offset(y:35)
                        .shadow(color: .black, radius: 2)
                }
                Spacer()
            }//:HSTACK
            .padding(.vertical,15)
            .padding(.horizontal,15)
            HStack(spacing:40) {
                HStack(spacing:5){
                    Image(systemName: "calendar")
                    if let releaseDate = movie.release_date {
                        Text(releaseDate)
                            .font(.caption2)
                            .shadow(color: .black, radius: 1)
                    }
                }//:HSTACK

                HStack(spacing:5){
                        Image(systemName: "clock")
                    if let runtime = movie.runtime {
                        Text("\(runtime) Minutes")
                            .font(.caption2)
                            .shadow(color: .black, radius: 1)
                    }
                    }//:HSTACK
                HStack(spacing:5){
                        Image(systemName: "ticket")
                    if let genre = movie.genres {
                        Text(genre[0].name!)
                            .font(.caption2)
                            .shadow(color: .black, radius: 1)
                    }
                    }//:HSTACK
                }//:HSTACK
            .fontWeight(.medium)
            .foregroundStyle(Color.textBase)
            .padding(.horizontal,10)
        }//:VSTACK
    }
}

#Preview {
    Frontdrop(movie: sampleMovieDetail)
}
