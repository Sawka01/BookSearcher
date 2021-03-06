//
//  BookSearcherPresenter.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

/// Presentation Logic
protocol BookSearcherPresentationLogic: AnyObject {
    /// Successfully received book from server
    /// - Parameter book: book
    func successfullyReceived(book: Book)
}

/// Presenter logic for handling event of View Controller
protocol BookSearcherViewOutput {
    /// Get books from server
    /// - Parameter urlString: URL to get data from server
    func getBooksFrom(urlString: String)
    /// Open book details view controller
    /// - Parameter item: book info
    func openBookDetails(book: Item)
}

final class BookSearcherPresenter {
    weak var view: BookSearcherProtocol?
    var interactor: BookSearcherInteractorProtocol?
    var router: BookSearcherRouterProtocol?
}

// MARK: - BookSearcherViewOutput
extension BookSearcherPresenter: BookSearcherViewOutput {
    /// Get books from server
    /// - Parameter urlString: URL to get data from server
    func getBooksFrom(urlString: String) {
        interactor?.getBooksFrom(urlString: urlString)
    }
    /// Open book details view controller
    /// - Parameter item: book info
    func openBookDetails(book: Item) {
        router?.routeTo(target: .bookDetails(book))
    }
}

// MARK: - BookSearcherPresentationLogic
extension BookSearcherPresenter: BookSearcherPresentationLogic {
    /// Successfully received book from server
    /// - Parameter book: book
    func successfullyReceived(book: Book) {
        view?.successfullyReceived(book: book)
    }
}
