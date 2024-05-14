//
//  SearchView.swift
//  CinemaSeeker
//
//  Created by Murat on 12.05.2024.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var searchToDetail: ChangePage
    @StateObject var viewModel = SearchViewModel()
    @State private var searchTerm: String = ""
    @State private var isComplete: Bool = false
    var body: some View {
        if searchToDetail.showingSearchView == true {
            VStack{
                TextField("Search", text: $searchTerm) {
                    viewModel.getMovies(query: searchTerm)
                    withAnimation(.linear(duration: 1)) {
                        if searchTerm == ""{
                            self.isComplete = false
                        } else {
                            self.isComplete = true}}
                }//:TEXTFIELD
                .font(.titleMedium)
                .fontWeight(.bold)
                .padding(.horizontal,15)
                .frame(height: 45)
                .foregroundStyle(Color.textBase)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.textBase2.opacity(0.5))
                        .stroke(Color.textBase2, lineWidth: 2))
                .shadow(color: .black.opacity(0.5), radius: 2)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.textBase)
                        .padding(.horizontal,25)
                    ,alignment: .trailing
                )
                VStack {
                    if isComplete == false {
                        Spacer()
                        DefaultState()
                            .padding(.horizontal,100)
                        Spacer()
                    } else {
                        SearchMovieList(movies: viewModel.searchedMovies)
                    }
                }//:VSTACK
                Spacer()
            }//:VSTACK
            .background(BackgroundStyle.background)}
        else if 
            searchToDetail.showingDetailView == true &&
                searchToDetail.selecetedMovieId != nil {
            DetailView(movieId: searchToDetail.selecetedMovieId!)
        }
                
    }
}

#Preview {
    SearchView()
}
