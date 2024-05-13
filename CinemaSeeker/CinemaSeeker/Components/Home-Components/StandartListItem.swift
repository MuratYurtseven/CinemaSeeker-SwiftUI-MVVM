//
//  StandartListItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct StandartListItem: View {
    var movie: Movie
    var body: some View {
        VStack(spacing:0){
            if let imagePath = movie.poster_path{
                ImageItem(imagePath: imagePath)
                    .frame(width: 100,height: 145)
                    .clipShape(.rect(cornerRadius: 16))
            }
        }
        .padding(.vertical,10)
        .padding(.horizontal,10)
    }
}

#Preview {
    StandartListItem(movie: sampleMovie)
}
