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

    private var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    enum Targets {
        case bookDetails(Item)
    }

    func routeTo(target: BookSearcherRouter.Targets) {
        switch target {
        case .bookDetails(let book):
            let bookDetailsViewController = BookDetailsViewController()
            BookDetailsConfigurator(book: book).configure(
                with: bookDetailsViewController,
                navigationController: navigationController
            )
            navigationController?.pushViewController(
                bookDetailsViewController,
                animated: true
            )
        }
    }
}
