//
//  TitleView.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct TitleView: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.titleLarge)
            .fontWeight(.black)
            .shadow(color: .gray,radius: 2)
            .foregroundStyle(.text)
    }
}

#Preview {
    TitleView(title: "Top Rated Movies")
}
