//
//  TopRatedListItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct TopRatedListItem: View {
    //MARK: - PROPERTIES
    var movie: Movie
    var number: Int
    //MARK: - BODY
    var body: some View {
        ZStack {
            if let imagePath = movie.poster_path{
                ImageItem(imagePath: imagePath)
                    .scaledToFit()
                    .frame(width: 140,height: 210)
                    .clipShape(.rect(cornerRadius: 16))
                
                StrokeText(
                    text: "\(number)",
                    width: 0.75,
                    color: .textStroke)
                .font(.titleVeryLarge)
                .fontWeight(.bold)
                .imageScale(.large)
                .offset(x:-60,y:90)
                .foregroundStyle(Color.backgroundDark)
                
            }
        }//:ZSTACK
        .padding(.vertical,15)
        .padding(.horizontal,15)
    }
}

#Preview {
    TopRatedListItem(movie: sampleMovie, number: 1)
}
