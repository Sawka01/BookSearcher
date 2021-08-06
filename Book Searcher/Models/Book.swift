//
//  Book.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import Foundation

struct Book: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    let title: String
    let authors: [String]
    let averageRating: Double?
    let ratingsCount: Int?
    let imageLinks: ImageLinks
    let subtitle: String?
}

struct ImageLinks: Decodable {
    let smallThumbnail: String
    let thumbnail: String
}
