//
//  HomeView.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import SwiftUI

struct HomeView: View {
    let network : MovieNetwork = MovieNetwork()
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .onAppear(perform: {
            /*network.fetchMovieGenreList { result in
                switch result {
                case .success(let success):
                    print(success.genres)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
            /*network.fetchPopularList { result in
                switch result {
                case .success(let success):
                    print(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
            /*network.fetchUpcomingList { result in
                switch result {
                case .success(let success):
                    print(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
            /*network.fetchNowPlayingList { result in
                switch result {
                case .success(let success):
                    print(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success

            /*network.fetchWithGenreMovies(with: 37) { result in
                switch result {
                case .success(let success):
                    print(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
            /*network.fetchMovieSearch(query: "Dune") { result in
                switch result {
                case .success(let success):
                    print(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
            /*network.fetchMovieDetail(withId: 845111) { result in
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
            /*network.fetchCastList(withId: 845111) { result in
                switch result {
                case .success(let success):
                    print(success.cast)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
            /*network.fetchSimilarList(withId: 845111) { result in
                switch result {
                case .success(let success):
                    print(success.results)
                case .failure(let failure):
                    print(failure)
                }
            }*/ //=> Success
            
        })
    }
}

#Preview {
    HomeView()
}
