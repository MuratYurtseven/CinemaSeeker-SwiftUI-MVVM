//
//  DefaultState.swift
//  CinemaSeeker
//
//  Created by Murat on 14.05.2024.
//

import SwiftUI

struct DefaultState: View {
    var body: some View {
        VStack {
            Image("searchIcon")
                .resizable()
                .scaledToFit()
            .frame(width: 100,height: 100)
            Text("we are sorry, we can not find the movie :(")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    DefaultState()
}
