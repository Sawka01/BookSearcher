//
//  BaseConfiguratorProtocol.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit

/// Basic scene configuration protocol
protocol BaseConfiguratorProtocol {
    /// Scene configuration method
    /// - Parameters:
    ///     - viewController: view controller object
    ///     - navigationController: navigation controller
    func configure(with viewController: UIViewController, navigationController: UINavigationController?)
}
