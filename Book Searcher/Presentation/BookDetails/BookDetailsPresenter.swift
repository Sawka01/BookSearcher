//
//  BookDetailsPresenter.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit

/// Presentation Logic
protocol BookDetailsPresentationLogic: AnyObject {
    func successfullyDownloaded(image: UIImage)
    func getBook(_ book: Item?)
}

/// Presenter logic for handling event of View Controller
protocol BookDetailsViewOutput {
    func getBookDetails()
}

final class BookDetailsPresenter {
    weak var view: BookDetailsProtocol?
    var interactor: BookDetailsInteractorProtocol?
    var router: BookDetailsRouterProtocol?
}

// MARK: - BookDetailsViewOutput
extension BookDetailsPresenter: BookDetailsViewOutput {
    func getBookDetails() {
        interactor?.getBookDetails()
    }
}

// MARK: - BookDetailsPresentationLogic
extension BookDetailsPresenter: BookDetailsPresentationLogic {
    func successfullyDownloaded(image: UIImage) {
        view?.updateBookImageView(with: image)
    }

    func getBook(_ book: Item?) {
        view?.getBook(book)
    }
}
