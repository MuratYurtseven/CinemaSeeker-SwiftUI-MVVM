//
//  NowPlayingList.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct NowPlayingList: View {
    var movies: [Movie]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:0){
                ForEach(movies,id:\.self){ movie in
                    NowPlayingListItem(movie: movie)
                }
            }
        }
    }
}

#Preview {
    NowPlayingList(movies: [sampleMovie,sampleMovie])
}

