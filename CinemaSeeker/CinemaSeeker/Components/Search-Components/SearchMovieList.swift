//
//  SearchMovieList.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct SearchMovieList: View {
    var movies: [Movie]
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment:.leading,spacing: 15){
                ForEach(movies,id:\.self){ movie in
                    SearchMovieItem(movie: movie)
                    
                }//:LOOP
            }//:VSTACK
        }//:SCROLL
    }
}

#Preview {
    SearchMovieList(movies: [sampleMovie,sampleMovie])
}
