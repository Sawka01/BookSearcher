//
//  BookSearcherRouter.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

/// Protocol of router logic
protocol BookSearcherRouterProtocol {
    /// Route to book details view controller
    /// - Parameter target: target
    func routeTo(target: BookSearcherRouter.Targets)
}

/// Router of Book Searcher module
final class BookSearcherRouter: BookSearcherRouterProtocol {

    enum Targets {
        case bookDetails(Item)
    }

    func routeTo(target: BookSearcherRouter.Targets) {
        switch target {
        case .bookDetails(let book):
            print(book)
        }
    }
}
