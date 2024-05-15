//
//  TopRatedList.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct TopRatedList: View {
    //MARK: - PROPERTIES
    var movies: [Movie]
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:0){
                ForEach(movies.indices,id:\.self){ indeks in
                    TopRatedListItem(movie: movies[indeks], number: indeks+1)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.75)
                        }
                }//:LOOP
            }//:HSTACK
        }//:Scroll
    }
}

#Preview {
    TopRatedList(movies: [sampleMovie])
        
}
