//
//  InfoList.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct InfoList: View {
    @State var views: [AnyView] = []
    var detailMovie: MovieDetail
    var similarMovies: [Movie]
    var casts: [Casts]
    var body: some View {
        TabView{
            ForEach(views.indices,id:\.self){ indeks in
                views[indeks]
            }
            }
        .tabViewStyle(PageTabViewStyle())
        .onAppear(perform: {
            views.append(AnyView(Overview(movie:detailMovie)))
            views.append(AnyView(Similar(movies: similarMovies)))
            views.append(AnyView(CastsList(casts: casts)))
        })
    }
}

