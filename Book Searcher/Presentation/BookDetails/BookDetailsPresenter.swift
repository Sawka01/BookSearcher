//
//  BookDetailsPresenter.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit

/// Presentation Logic
protocol BookDetailsPresentationLogic: AnyObject {}

/// Presenter logic for handling event of View Controller
protocol BookDetailsViewOutput {}

final class BookDetailsPresenter {
    weak var view: BookDetailsProtocol?
    var interactor: BookDetailsInteractorProtocol?
    var router: BookDetailsRouterProtocol?
}

// MARK: - BookDetailsViewOutput
extension BookDetailsPresenter: BookDetailsViewOutput {}

// MARK: - BookDetailsPresentationLogic
extension BookDetailsPresenter: BookDetailsPresentationLogic {}
