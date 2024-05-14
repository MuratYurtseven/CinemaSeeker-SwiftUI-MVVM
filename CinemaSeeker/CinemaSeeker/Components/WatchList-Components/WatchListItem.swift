//
//  WatchListItem.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct WatchListItem: View {
    var movie: WatchListMovie
    var body: some View {
        HStack {
            ImageItem(imagePath: movie.imagePath)
                .clipShape(.rect(cornerRadius: 16))
                .frame(width: 170,height: 210)
            VStack (alignment:.leading,spacing: 30){
                
                Text(movie.title)
                    .font(.titleLarge)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.textBase)
                    .shadow(color: .black, radius: 4)
                    .lineLimit(2)
                
                Text(movie.tagline)
                    .font(.buttonBase)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.textBase2)
                
                Text("\(movie.addedTime.formatted(date: .abbreviated, time: .omitted))")
                    .font(.buttonBase)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.textBase)
                
            }//:VSTACK
        }//:HSTACK
        .padding(.vertical,10)
        .padding(.horizontal,10)
    }
}

#Preview {
    WatchListItem(movie: sampleWatchList)
}
