//
//  MovieCardList.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct MovieCardList: View {
    var movies: [Movie]
    var body: some View {
        VStack(spacing:15){
            GeometryReader(content: { geometry in
                let size = geometry.size
                ScrollView(.horizontal,showsIndicators: false){
                    HStack {
                        ForEach(movies,id:\.self){ movie in
                            GeometryReader(content: { geometry2 in
                                MovieCardItem(movie: movie)
                            })//:GREADER2
                            .frame(width: size.width - 100)
                            .scrollTransition(.interactive,axis: .horizontal){ view , phase in
                                view
                                    .scaleEffect(phase.isIdentity ? 1 : 0.9)}
                        }//:LOOP
                    }//:HSTACK
                    .padding(.horizontal,30)
                    .scrollTargetLayout(isEnabled: true)
                }//:SCROLL
                .scrollTargetBehavior(.viewAligned)
            })//:GREADER
            .frame(height: 400)
            .padding(.horizontal,15)
        }//:VSTACK
    }
}

#Preview {
    MovieCardList(movies:[sampleMovie])
}
