//
//  GenreNavigationView.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreNavigationView: View {
    @EnvironmentObject var genreToHome: ChangePage
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.easeIn(duration: 2)) {
                    genreToHome.showingHomeView = true
                    genreToHome.showingGenreView = false
                    genreToHome.selecetedGenre = nil
                }
            }, label: {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.textBase)
                    .font(.title)
            })
            NavigationBarView()
        }
        .padding(.horizontal,10)
    }
}

#Preview {
    GenreNavigationView()
}
