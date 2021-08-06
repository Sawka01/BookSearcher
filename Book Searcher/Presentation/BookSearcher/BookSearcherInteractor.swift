//
//  BookSearcherInteractor.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

/// Interactor business logic
protocol BookSearcherInteractorProtocol {
    /// Get books from server
    /// - Parameter urlString: URL to get data from server
    func getBooksFrom(urlString: String)
}

/// Interactor of Book Searcher module
final class BookSearcherInteractor {

    /// Link to presentation logic
    weak var presenter: BookSearcherPresentationLogic?

    private let apiService: APIServiceProtocol = APIService()
}

// MARK: - BookSearcherInteractorProtocol
extension BookSearcherInteractor: BookSearcherInteractorProtocol {
    /// Get books from server
    /// - Parameter urlString: URL to get data from server
    func getBooksFrom(urlString: String) {
        apiService.getBooksFrom(urlString: urlString) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let book):
                self.presenter?.successfullyReceived(book: book)
            case .failure(let error):
                print(error)
            }
        }
    }
}
