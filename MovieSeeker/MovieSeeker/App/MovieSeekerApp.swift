//
//  MovieSeekerApp.swift
//  CinemaSeeker
//
//  Created by Murat on 11.05.2024.
//

import SwiftUI

@main
struct MovieSeekerApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ChangePage())
        }
    }
}
