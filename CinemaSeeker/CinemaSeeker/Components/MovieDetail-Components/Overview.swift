//
//  Overview.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct Overview: View {
    var movie: MovieDetail
    var body: some View {
        VStack(alignment: .leading,spacing: 5){
            Text("Overview")
                .font(.titleMedium)
                .fontWeight(.black)
            
            if let overview = movie.overview{
                Text(overview)
                    .font(.detailBase)
                    .fontWeight(.medium)
                    .lineLimit(6)
            }
            
            Text("Tagline")
                .font(.titleMedium)
                .fontWeight(.black)
            if let tagline = movie.tagline{
                Text(tagline)
                    .font(.detailBase)
                    .fontWeight(.medium)
                    .lineLimit(6)
            }
            Spacer()
            
        }//:VSTACK
        .clipShape(.rect(cornerRadius: 6))
        .padding(.horizontal,5)
    }
}

#Preview {
    Overview(movie: sampleMovieDetail)
}
