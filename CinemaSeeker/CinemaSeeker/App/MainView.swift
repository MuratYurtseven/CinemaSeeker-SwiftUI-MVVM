//
//  MainView.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            //MARK: - TabItem(Home)
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")}
                }
            //MARK: - TabItem(Search)
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")}
                }
            
            //MARK: - TabItem(WatchList)
            WatchListView()
                .tabItem {
                    VStack {
                        Image(systemName: "bookmark")
                        Text("Watch List")}
                }
        }//:TABVIEW
        .tint(Color.tabBarTintBase)
    }
}

#Preview {
    MainView()
}
