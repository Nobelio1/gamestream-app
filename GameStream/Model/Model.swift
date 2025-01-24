//
//  Model.swift
//  GameStream
//
//  Created by Gino Alejandro on 21/01/25.
//

import Foundation

struct Resultados: Codable{
    var results: [Game]
}


// MARK: - Game
struct Game: Codable,Hashable {
    let title, studio, contentRaiting, publicationYear: String
    let description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

// MARK: - VideosUrls
struct VideosUrls: Codable, Hashable {
    let mobile, tablet: String
}

