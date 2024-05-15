//
//  WatchListView.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import SwiftUI

struct WatchListView: View {
    @StateObject var viewModel = WatchListViewModel()
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            NavigationBarView()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(BackgroundStyle.navigationBackground)
                .clipShape(.rect(cornerRadius: 25))
                .shadow(color: .black.opacity(0.085), radius: 5, x: 0, y: 10)
            
            TitleView(title: "Watch List")
                .padding(.horizontal,10)

            WatchListList(watchMovies: viewModel.watchlistMovies)

        }
        .background(BackgroundStyle.background)
        .ignoresSafeArea(.all,edges: .top)
        .onAppear(perform: {
            viewModel.getWatchListMovies()
        })
    }
}

#Preview {
    WatchListView()
}
