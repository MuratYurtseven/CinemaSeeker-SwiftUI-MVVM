//
//  StandartList.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct StandartList: View {
    var movies: [Movie]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:0){
                ForEach(movies,id:\.self){ movie in
                    StandartListItem(movie: movie)
                }//:LOOP
            }//:HSTACK
        }//:SCROLL
    }
}

#Preview {
    StandartList(movies: HomeViewModel().popularMovies)
}
