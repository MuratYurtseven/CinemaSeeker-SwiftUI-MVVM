//
//  CastItem.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct CastItem: View {
    var cast: Casts
    var body: some View {
        VStack(alignment:.leading){
            if let imagePath = cast.profile_path,let character = cast.character,let name = cast.original_name{
                ImageItem(imagePath: imagePath)
                    .frame(width: 120,height: 155)
                    .shadow(color: .black, radius: 1)
                    .clipShape(.rect(cornerRadius: 16))
                
                VStack(alignment:.leading,spacing: 5){
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .font(.detailBase)
                            .fontWeight(.black)
                        if let gender = cast.getGenderString() {
                            Text(gender)
                                .font(.detailBase)
                        }
                    }//:HSTACK
                    VStack(alignment:.leading){
                        Text(character)
                            .lineLimit(1)
                        Text(name)
                            .lineLimit(1)
                    }
                    .font(.detailBase)
                }//:VSTACK
            }//:CONDITION
            
        }//:VSTACK
    }
}

