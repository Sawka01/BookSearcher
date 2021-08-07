//
//  BookDetailsViewController.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit

/// Logic of displaying view to the user of event processing results
protocol BookDetailsProtocol: AnyObject {}

final class BookDetailsViewController: UIViewController {

    /// Link to presentation layer
    var presenter: BookDetailsPresenter?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

// MARK: - BookDetailsProtocol
extension BookDetailsViewController: BookDetailsProtocol {}
