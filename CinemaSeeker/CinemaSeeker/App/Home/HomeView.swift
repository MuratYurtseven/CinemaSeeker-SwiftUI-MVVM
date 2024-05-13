//
//  HomeView.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var number = 0
    @State var isAppear: Bool = false
    var body: some View {
        ZStack{
            VStack(spacing:20){
                NavigationBarView()
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(BackgroundStyle.navigationBackground)
                    .clipShape(.rect(cornerRadius: 25))
                    .shadow(color: .black.opacity(0.085), radius: 5, x: 0, y: 10)
                
                ScrollView(.vertical,showsIndicators: false){
                    GenreList(genres: viewModel.genres)
                        .padding(.leading,10)
                        .opacity(isAppear ? 1 : 0)
                    
                    MovieCardList(movies: viewModel.upcomingMovies)
                        .padding(.bottom,35)
                        .opacity(isAppear ? 1: 0)
                    
                    VStack (alignment: .leading){
                        TitleView(title: "Top Rated Movies")
                            .padding(.leading,10)
                        TopRatedList(movies: viewModel.topRatedMovies)
                    }//:VSTACK
                    .padding(.bottom,35)
                    .opacity(isAppear ? 1: 0)
                    
                    VStack(alignment:.leading){
                        TitleView(title: "Now Playing Movies")
                            .padding(.leading,10)
                        NowPlayingList(movies: viewModel.nowPlayingMovies)
                    }//:VSTACK
                    .padding(.bottom,35)
                    .opacity(isAppear ? 1 :0)
                    
                    
                    VStack(alignment:.leading){
                        TitleView(title: "Popular Movies")
                            .padding(.leading,10)
                        StandartList(movies: viewModel.popularMovies)
                    }//:VSTACK
                    .padding(.bottom,35)
                    .opacity(isAppear ? 1 :0)
                    
                    VStack(alignment:.leading){
                        TitleView(title: "Upcoming Movies")
                            .padding(.leading,10)
                        StandartList(movies: viewModel.upcomingMovies)
                    }//:VSTACK
                    .padding(.bottom,35)
                    .opacity(isAppear ? 1 :0)
                }//:SCROLL
                .onAppear(perform: {
                    withAnimation(.easeIn(duration: 0.1)){
                        isAppear = true
                    }
                })
            }//:VSTACK
        }//:ZSTACK
        .background(BackgroundStyle.background)
        .ignoresSafeArea(.all,edges: .top)
        
    }
}

#Preview {
    HomeView()
}
