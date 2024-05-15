//
//  ImageItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct ImageItem: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var homeToDetail: ChangePage
    @StateObject var imageNetwork = ImageNetwork()
    var imagePath: String
    var movieId: Int?
    //MARK: - BODY
    var body: some View {
        VStack {
            if let uiImage = imageNetwork.image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        if let id = movieId{
                            withAnimation(.linear(duration: 1.75)) {
                                self.homeToDetail.showingHomeView = false
                                self.homeToDetail.showingSearchView = false
                                self.homeToDetail.showingDetailView = true
                                self.homeToDetail.selecetedMovieId = id
                            }}}
            }
        }
        .task {
            let _ = imageNetwork.downloandImage(from:imagePath )
        }
    }
        
}

#Preview {
    ImageItem(imagePath: "hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg", movieId: 1)
        .environmentObject(ChangePage())
}
