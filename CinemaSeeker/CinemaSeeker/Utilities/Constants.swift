//
//  Constants.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI


let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 5
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 2)
}

let sampleMovie: Movie = Movie(
    adult: true,
    backdrop_path: "/qGJASuD3fs9ZBxuEZoxCLVidVq8.jpg",
    genre_ids: [12],
    id: 845111,
    original_title: "Les trois mousquetaires : Milady",
    overview: "D'Artagnan, on a quest to rescue the abducted Constance, runs into the mysterious Milady de Winter again. The tension between the Catholics and the Protestants finally escalates, as the king declares war — forcing the now four musketeers into battle. But as the war goes on, they are tested physically, mentally and emotionally.",
    popularity: 629.256,
    poster_path: "/rtosxP5sXuoRFPH4sVbMccLIPiV.jpg",
    release_date: "2023-12-13",
    title: "The Three Musketeers: Milady",
    video: false,
    vote_average: 6.516,
    vote_count: 394)

let sampleGenre: Genre = Genre(
    id: 12,
    name: "Adventure")

let sampleMovieDetail: MovieDetail = MovieDetail(
    backdrop_path: "/qGJASuD3fs9ZBxuEZoxCLVidVq8.jpg",
    budget: 39000000,
    genres: [Genre(id: 12, name: "Adventure")],
    id: 845111,
    origin_country: ["FR"],
    original_language: "fr",
    original_title: "Les trois mousquetaires : Milady",
    overview: "D'Artagnan, on a quest to rescue the abducted Constance, runs into the mysterious Milady de Winter again. The tension between the Catholics and the Protestants finally escalates, as the king declares war — forcing the now four musketeers into battle. But as the war goes on, they are tested physically, mentally and emotionally.",
    popularity: 629.256,
    poster_path: "/rtosxP5sXuoRFPH4sVbMccLIPiV.jpg",
    release_date: "2023-12-13",
    runtime: 121,
    status: "Released",
    tagline: "The adventure continues, chaos ensues...",
    title: "The Three Musketeers: Milady",
    vote_average: 6.516,
    vote_count: 394)

let sampleFavourite = FavouriteMovie(id: 1, title: "GodFather", imagePath: "hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg", voteRate: 6.784545)

let sampleWatchList = WatchListMovie(id: 1, title: "GodFather", imagePath: "hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg", tagline: "some thing happen in any time When what you think there is no hope to live in this world forever.")

