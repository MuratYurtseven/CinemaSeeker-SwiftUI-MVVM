//
//  DetailNavigationBar.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct DetailNavigationBar: View {
    @EnvironmentObject var detailToHome: ChangePage
    @State var isTapped: Bool = false
    var movie: MovieDetail
    var body: some View {
        HStack(spacing:4){
            Button(action: {
                withAnimation(.linear(duration: 2)) {
                    detailToHome.showingHomeView = true
                    detailToHome.showingSearchView = true
                    detailToHome.showingDetailView = false
                    detailToHome.selecetedMovieId = nil
                }
            }, label: {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.textBase)
                    .font(.titleLarge)
            })
            Spacer()
            NavigationBarView()
            Spacer()
            Button(action: {
                self.isTapped.toggle()
                if
                    let id = movie.id,
                    let title = movie.title,
                    let imagePath = movie.poster_path,
                    let tagline = movie.tagline{
                    let watchListMovie = WatchListMovie(
                        id: id,
                        title: title,
                        imagePath: imagePath,
                        tagline: tagline)
                    PersistanceManager.updateWatchListWith(movie: watchListMovie, actionType: .add) { error in
                        print(error)
                    }
                }
                    
                    
            }, label: {
                Image(systemName: isTapped ? "bookmark.fill": "bookmark")
                    .foregroundStyle(Color.textBase)
                    .font(.titleLarge)
            })
        }//:HSTACK
        .padding(.horizontal,10)
        .padding(.vertical,5)
    }
}

#Preview {
    DetailNavigationBar(movie: sampleMovieDetail)
        .environmentObject(ChangePage())
}
