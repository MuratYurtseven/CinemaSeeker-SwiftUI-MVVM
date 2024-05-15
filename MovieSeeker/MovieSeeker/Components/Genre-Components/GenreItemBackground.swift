//
//  GenreItemBackground.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct GenreItemBackground: View {
    var body: some View {
        ZStack {
            //MARK: - DEPTH
            Color.genreDarkBackground
                .cornerRadius(40)
                .offset(y:12)
            
            //MARK: - LIGHT
            Color.genreLightBackground
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            //MARK: - SURFACE
            LinearGradient(colors: [
                .genreLightBackground,.genreMediumBackground], startPoint: .top, endPoint: .bottom)
            .cornerRadius(40)
        }
    }
}

#Preview {
    GenreItemBackground()
}
