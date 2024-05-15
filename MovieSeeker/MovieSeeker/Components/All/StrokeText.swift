//
//  StrokeText.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

#Preview {
    StrokeText(text: "1", width: 0.75, color: Color.textStrokeBase)
}
