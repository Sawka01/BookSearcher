//
//  BookDetailsConfigurator.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit

final class BookDetailsConfigurator {
    private let book: Item

    init(book: Item) {
        self.book = book
    }
}

// MARK: - BaseConfiguratorProtocol
extension BookDetailsConfigurator: BaseConfiguratorProtocol {
    func configure(
        with viewController: UIViewController,
        navigationController: UINavigationController?
    ) {
        guard
            let viewController = viewController as? BookDetailsViewController
        else { return }

        let presenter = BookDetailsPresenter()
        let interactor = BookDetailsInteractor()
        let router = BookDetailsRouter()

        interactor.presenter = presenter
        interactor.book = book
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
    }
}
