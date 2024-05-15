//
//  WatchListList.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct WatchListList: View {
    var watchMovies: [WatchListMovie]
    @State var isTapped: Bool = false
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack{
                ForEach(watchMovies,id:\.self) { movie in
                   WatchListItem(movie: movie)
                        .onTapGesture {
                            self.isTapped = true
                        }
                }//:LOOP
            }//:VSTACK
        }//:SCROLL
        .sheet(isPresented: $isTapped, content: {
            VStack{
                Button(action: {
                    isTapped = false
                }, label: {
                    Text("Delete")
                })
            }
            .padding(.top,5)
            .presentationDetents([.fraction(0.1)])
            .presentationDragIndicator(.hidden)
        })
    }
}

#Preview {
    WatchListList(watchMovies: [sampleWatchList,sampleWatchList])
}
