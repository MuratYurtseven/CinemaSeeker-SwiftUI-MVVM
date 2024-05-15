//
//  CastsList.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct CastsList: View {
    var casts: [Casts]
    var body: some View {
        VStack(alignment:.leading,spacing: 5){
            Text("Casts")
                .font(.titleMedium)
                .fontWeight(.black)
            
            ScrollView(.vertical,showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
                    ForEach(casts,id:\.self) { cast in
                        CastItem(cast: cast)
                            .padding(.horizontal,10)
                    }//:LOOP
                })//:LAZYHG
            }//:SCROLL

        }//:VSTACK
        .clipShape(.rect(cornerRadius: 6))
        .padding(.horizontal,5)
    }
}

