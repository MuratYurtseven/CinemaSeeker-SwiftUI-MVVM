//
//  Backdrop.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct Backdrop: View {
    var movieDetail: MovieDetail
    @State var isTapped: Bool = false
    @State var isRated: Bool = false
    @State var voteRate: Double = 0
    var body: some View {
        VStack{
            if let imagePath = movieDetail.backdrop_path,let voteRate = movieDetail.vote_average{
                ImageItem(imagePath: imagePath)
                    .scaledToFit()
                    .overlay(
                        HStack(spacing:15) {
                            Image(systemName:isRated ? "star.fill" :"star")
                                .onTapGesture {
                                    self.isTapped.toggle()
                                    self.isRated.toggle()
                                }
                            Text(NSNumber(value:voteRate),formatter: doubleFormatter)
                        }//:HSTACK
                            .font(.titleMedium)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.star)
                            .padding(.horizontal,10)
                            .padding(.vertical,5)
                            .background(BackgroundStyle.navigationBackground)
                            .clipShape(.rect(cornerRadius: 16))
                            .padding(.bottom,15)
                            .padding(.trailing,15)
                            
                        ,alignment: .bottomTrailing

                    )//:OVERLAY
            }//:CONDITION
        }//:VSTACK
        .sheet(isPresented: $isTapped, content: {
            VStack{
                Slider(value: $voteRate, in: 0...10)
                    .tint(Color.star)
                Text(NSNumber(value: voteRate),formatter: doubleFormatter)
                    .font(.titleMedium)
                    .fontWeight(.bold)
                HStack{
                    Button(action: {
                        self.voteRate = 0
                        self.isTapped = false
                        self.isRated = false
                    }, label: {
                        Text("Cancel")
                    })
                    Spacer()
                    Button(action: {
                        self.isTapped = false
                        self.isRated = true
                        print("Saved: \(voteRate)")
                    }, label: {
                        Text("Save")
                    })
                }
                .padding(.horizontal,10)
                Spacer()
            }//:VSTACK
            .foregroundStyle(Color.star)
            .background(BackgroundStyle.navigationBackground)
            .presentationDetents([.fraction(0.15)])
            .presentationDragIndicator(.hidden)
        })
        
    }
}

#Preview {
    Backdrop(movieDetail: sampleMovieDetail)
}
