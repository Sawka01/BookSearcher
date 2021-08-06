//
//  BookSearcherConfigurator.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

/// Basic scene configuration protocol
protocol BookSearcherConfiguratorProtocol {
    /// Scene configuration method
    /// - Parameter viewController: view controller object
    func configure(with viewController: UIViewController)
}

/// Configurator of Book Searcher module
final class BookSearcherConfigurator: BookSearcherConfiguratorProtocol {
    func configure(with viewController: UIViewController) {
        guard
            let viewController = viewController as? BookSearcherViewController
        else { return }

        let presenter = BookSearcherPresenter()
        let interactor = BookSearcherInteractor()
        let router = BookSearcherRouter()

        interactor.presenter = presenter
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
    }
}
