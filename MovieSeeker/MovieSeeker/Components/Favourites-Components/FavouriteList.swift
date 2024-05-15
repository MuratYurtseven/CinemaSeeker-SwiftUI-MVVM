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
    @State var isTappedDelete: Bool = false
    @State var isTappedUpdate: Bool = false
    @State var voteRate: Double = 0
    @State var selectedMovie: FavouriteMovie? = nil
    @State private var showingConfirmation = false
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
                        self.showingConfirmation = true
                        self.isTappedDelete = true
                        self.isTapped = false
                    }, label: {
                        Text("Delete")
                    })
                    Spacer()
                    Button(action: {
                        self.showingConfirmation = true
                        self.isTappedUpdate = true
                        self.isTapped = false
   
                    }, label: {
                        Text("Update")
                        
                    })//:BUTTON
                }
            }
                .padding(.horizontal,10)
                .presentationDetents([.fraction(0.15)])
                .presentationDragIndicator(.hidden)
        })
        .confirmationDialog("Title",isPresented: $showingConfirmation) {
            Button("Cancel", role: .destructive) { }
            
            Button("Yes",role: .cancel) {
                if isTappedUpdate {
                    if var updatedMovie = selectedMovie {
                        PersistanceManager.updateFavouritesWith(movie: updatedMovie, actionType: .remove) { error in
                            print(error)
                        }
                        updatedMovie.voteRate = voteRate
                        PersistanceManager.updateFavouritesWith(movie: updatedMovie, actionType: .add) { error in
                            print(error)
                            
                            isTappedUpdate = false
                        }
                        withAnimation(.easeIn(duration: 1)) {
                            viewModel.getFavouriteMovies()
                        }
                        
                    }
                }//:CONDITION
                else if isTappedDelete{
                    if var deleteMovie = selectedMovie {
                        PersistanceManager.updateFavouritesWith(movie: deleteMovie, actionType: .remove) { error in
                            print(error)
                        }
                        isTappedDelete = false
                        
                        withAnimation(.easeIn(duration: 1)) {
                            viewModel.getFavouriteMovies()
                        }
                        
                    }
                }
            }

        }message: {
            Text("Are you sure to do this?")
        }
        
        
       
    }
}

#Preview {
    FavouriteList(favouriteMovies: [sampleFavourite,sampleFavourite], viewModel: FavouritesViewModel())
}
