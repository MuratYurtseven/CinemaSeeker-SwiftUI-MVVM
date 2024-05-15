//
//  Similar.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct Similar: View {
    let title = "Similar Movies"
    var movies: [Movie]
    var body: some View {
        VStack(alignment:.leading,spacing: 5){
            Text("Similar Movies")
                .font(.titleMedium)
                .fontWeight(.black)
            ScrollView(.vertical,showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), alignment: .center, spacing: rowSpacing, pinnedViews: [], content: {
                    ForEach(movies,id:\.self) { movie in
                        if let imagePath = movie.poster_path{
                            ImageItem(imagePath: imagePath)
                                .frame(width: 120,height: 155)
                                .shadow(color: .black, radius: 1)
                                .clipShape(.rect(cornerRadius: 16))
                        }//:CONDITION
                    }//:LOOP
                })//:LAZYHG
            }//:SCROLL

        }//:VSTACK
        .clipShape(.rect(cornerRadius: 6))
        .padding(.horizontal,5)
    }
}

#Preview {
    Similar(movies: [sampleMovie])
}
