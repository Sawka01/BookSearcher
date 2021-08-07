//
//  BookDetailsInteractor.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit

/// Interactor business logic
protocol BookDetailsInteractorProtocol {}

/// Interactor of Book Details module
final class BookDetailsInteractor {
    /// Link to presentation logic
    weak var presenter: BookDetailsPresentationLogic?

    var book: Item?
}

// MARK: - BookDetailsInteractorProtocol
extension BookDetailsInteractor: BookDetailsInteractorProtocol {}
