//
//  BookSearcherConfigurator.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

/// Configurator of Book Searcher module
final class BookSearcherConfigurator: BaseConfiguratorProtocol {
    func configure(
        with viewController: UIViewController,
        navigationController: UINavigationController?
    ) {
        guard
            let viewController = viewController as? BookSearcherViewController
        else { return }

        let presenter = BookSearcherPresenter()
        let interactor = BookSearcherInteractor()
        let router = BookSearcherRouter(navigationController: navigationController)

        interactor.presenter = presenter
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
    }
}
