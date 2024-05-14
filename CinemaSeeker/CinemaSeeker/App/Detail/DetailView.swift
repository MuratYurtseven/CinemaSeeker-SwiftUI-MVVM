//
//  DetailView.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel()
    var movieId: Int
    var body: some View {
        VStack {
            DetailNavigationBar()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(BackgroundStyle.navigationBackground)
                .clipShape(.rect(cornerRadius: 25))
                .shadow(color: .black.opacity(0.085), radius: 5, x: 0, y: 10)
            if let movieDetail = viewModel.movieDetail{
                Backdrop(movieDetail: movieDetail)
                    .overlay(
                        Frontdrop(movie:movieDetail)
                            .offset(y:115)
                            ,
                            alignment: .bottom
                        )
                if viewModel.similarMovies != [] && viewModel.casts != []{
                    InfoList(
                        detailMovie: movieDetail,
                        similarMovies: viewModel.similarMovies,
                        casts: viewModel.casts)
                    .padding(.horizontal,10)
                    .padding(.top,125)
                }
                }
            

        }//:VSTACK
        .zIndex(0)
        .background(BackgroundStyle.background)
        .ignoresSafeArea(.all,edges: .top)
        .onAppear {
            self.viewModel.getMovieDetail(withId: movieId)
            self.viewModel.getSimilarMovies(withId: movieId)
            self.viewModel.getCasts(withId: movieId)
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DetailView(movieId: 845111)
        .environmentObject(ChangePage())
}
