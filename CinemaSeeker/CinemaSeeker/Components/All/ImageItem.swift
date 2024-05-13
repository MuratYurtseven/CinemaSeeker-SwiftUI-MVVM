//
//  ImageItem.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct ImageItem: View {
    //MARK: - PROPERTIES
    @StateObject var imageNetwork = ImageNetwork()
    var imagePath: String
    //MARK: - BODY
    var body: some View {
        VStack {
            if let uiImage = imageNetwork.image {
                Image(uiImage: uiImage)
                    .resizable()
            }
        }
        .task {
            let _ = imageNetwork.downloandImage(from:imagePath )
        }
    }
        
}

#Preview {
    ImageItem(imagePath: "hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg")
}
