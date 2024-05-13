//
//  MovieCardItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct MovieCardItem: View {
    var movie:Movie
    @State var isAnimating: Bool = false
    var body: some View {
        VStack{
            if let imagePath = movie.poster_path, let title = movie.title,let releaseDate = movie.release_date{
                ImageItem(imagePath: imagePath)
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 16))
                    .overlay{
                        TitleAndReleaseDate(title, releaseDate)
                    }
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
    
    @ViewBuilder
    func TitleAndReleaseDate(_ title: String, _ releaseData: String) -> some View {
        
        ZStack(alignment: .bottomLeading){
            LinearGradient(
                colors: [
                    .clear,
                    .clear,
                    .clear,
                    .clear,
                    .black.opacity(0.1),
                    .black.opacity(0.5),
                    .black],
                startPoint: .top,
                endPoint: .bottom)
            
            VStack(alignment:.leading){
                Text(title)
                    .font(.titleMedium)
                    .fontWeight(.black)
                    .foregroundStyle(Color.textBase)
                
                Text(releaseData)
                    .font(.titleLitle)
                    .fontWeight(.black)
                    .foregroundStyle(Color.textBase2)
            }//:VSTACK
            .padding(20)

        }//:ZSTACK
        .clipShape(.rect(cornerRadius: 16))
        
    }//:FUNC
    
}

#Preview {
    MovieCardItem(movie: sampleMovie)
}
