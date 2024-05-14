//
//  WatchListList.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct WatchListList: View {
    var watchMovies: [WatchListMovie]
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack{
                ForEach(watchMovies,id:\.self) { movie in
                   WatchListItem(movie: movie)
                }//:LOOP
            }//:VSTACK
        }//:SCROLL
    }
}

#Preview {
    WatchListList(watchMovies: [sampleWatchList,sampleWatchList])
}
