//
//  BookDetailsInteractor.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit
import Kingfisher

/// Interactor business logic
protocol BookDetailsInteractorProtocol {
    func getBookDetails()
}

/// Interactor of Book Details module
final class BookDetailsInteractor {
    /// Link to presentation logic
    weak var presenter: BookDetailsPresentationLogic?

    var book: Item?
}

// MARK: - BookDetailsInteractorProtocol
extension BookDetailsInteractor: BookDetailsInteractorProtocol {
    func getBookDetails() {
        guard
            let urlString = book?.volumeInfo.imageLinks.thumbnail
        else { return }
        guard let url = URL(string: urlString) else { return }
        KingfisherManager.shared.downloader.downloadImage(
            with: url
        ) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.presenter?.successfullyDownloaded(image: data.image)
            case .failure(let error):
                // TODO: Hande error
                print(error)
            }
        }

        presenter?.getBook(book)
    }
}
