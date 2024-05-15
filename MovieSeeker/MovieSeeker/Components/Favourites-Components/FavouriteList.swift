//
//  FavouriteList.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct FavouriteList: View {
    var favouriteMovies:[FavouriteMovie]
    @StateObject var viewModel: FavouritesViewModel
    @State var isTapped: Bool = false
    @State var voteRate: Double = 0
    @State var selectedMovie: FavouriteMovie? = nil
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack{
                ForEach(favouriteMovies,id:\.self) { movie in
                    FavouriteMovieItem(movie: movie)
                        .onTapGesture {
                            self.isTapped = true
                            self.selectedMovie = movie
                        }
                }//:LOOP
            }//:VSTACK
        }//:SCROLL
        .sheet(isPresented: $isTapped, content: {
            VStack{
                Slider(value: $voteRate, in: 0...10)
                    .tint(Color.star)
                Text(NSNumber(value: voteRate),formatter: doubleFormatter)
                    .font(.titleMedium)
                    .fontWeight(.bold)
                HStack{
                    Button(action: {
                        self.isTapped = false
                        if let movie = selectedMovie{
                            PersistanceManager.updateFavouritesWith(movie: movie, actionType: .remove) { error in
                                print(error)
                            }}
                        withAnimation(.easeIn(duration: 1)) {
                            viewModel.getFavouriteMovies()
                        }
                    }, label: {
                        Text("Delete")
                    })
                    Spacer()
                    Button(action: {
                        self.isTapped = false
                        if var updatedMovie = selectedMovie {
                            PersistanceManager.updateFavouritesWith(movie: updatedMovie, actionType: .remove) { error in
                                print(error)
                            }
                            updatedMovie.voteRate = voteRate
                            PersistanceManager.updateFavouritesWith(movie: updatedMovie, actionType: .add) { error in
                                print(error)
                                
                            }
                            withAnimation(.easeIn(duration: 1)) {
                                viewModel.getFavouriteMovies()
                            }
                            
                        }
                        
                        
                    }, label: {
                        Text("Update")
                        
                    })
                }
            }
                .padding(.horizontal,10)
                .presentationDetents([.fraction(0.15)])
                .presentationDragIndicator(.hidden)
        })
       
    }
}

#Preview {
    FavouriteList(favouriteMovies: [sampleFavourite,sampleFavourite], viewModel: FavouritesViewModel())
}
