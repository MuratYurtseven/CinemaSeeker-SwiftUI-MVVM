//
//  GenreItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreItem: View {
    var genre: Genre
    var body: some View {
        VStack(spacing:0){
            HStack {
                if let title = genre.name{
                    Text(title)
                        .font(.buttonBase)
                        .fontWeight(.black)
                        .foregroundStyle(Color.textBase)
                }
            }//:HSTACK
            .frame(height: 45)
            .padding(.horizontal,5)
            .background(Color.clear)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.textBase2,lineWidth: 2)
            )
        }//:VSTACK
        .padding(.horizontal,5)
        .padding(.vertical,10)
    }
}

#Preview {
    GenreItem(genre: sampleGenre)
}
