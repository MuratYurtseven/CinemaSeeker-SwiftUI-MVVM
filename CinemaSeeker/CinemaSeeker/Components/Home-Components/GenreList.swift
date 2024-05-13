//
//  GenreList.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreList: View {
    var genres: [Genre]
    var body: some View {
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:0){
                    ForEach(genres,id:\.self){ genre in
                        GenreItem(genre: genre)
                    }
                    
                }
            }

    }
}

#Preview {
    GenreList(genres: [sampleGenre])
}
