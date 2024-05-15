//
//  NavigationBarView.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Movie")
                .font(.titleMedium)
                .fontWeight(.black)
                .foregroundStyle(Color.textBase)
                .shadow(color: .black, radius: 2)
                .padding(.trailing,7)
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 40,height:40,alignment: .center)
            Text("Seeker")
                .font(.titleMedium)
                .fontWeight(.black)
                .foregroundStyle(Color.textBase)
                .shadow(color: .black, radius: 2)
                .padding(.trailing,7)
            Spacer()
        }

    }
}

#Preview {
    NavigationBarView()
}
