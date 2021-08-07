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
    let imageLinks: ImageLinks
    let description: String
}

struct ImageLinks: Decodable {
    let thumbnail: String
}
