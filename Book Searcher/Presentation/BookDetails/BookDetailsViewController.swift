//
//  BookDetailsViewController.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 07.08.2021.
//

import UIKit

/// Logic of displaying view to the user of event processing results
protocol BookDetailsProtocol: AnyObject {
    func updateBookImageView(with image: UIImage)
    func getBook(_ book: Item?)
}

final class BookDetailsViewController: UIViewController {

    /// Link to presentation layer
    var presenter: BookDetailsPresenter?

    // MARK: - Private Properties
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.cornerCurve = .continuous
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "placeholder")
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bookAuthorsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bookDescriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "• Book Description"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bookDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        layout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        presenter?.getBookDetails()
        setupNavigationBar()
    }
}

// MARK: - Setup
private extension BookDetailsViewController {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "left-arrow"), style: .done, target: self, action: #selector(leftBarButtonItemTouchUpInside))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

// MARK: - Actions
private extension BookDetailsViewController {
    @objc func leftBarButtonItemTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - BookDetailsProtocol
extension BookDetailsViewController: BookDetailsProtocol {
    func updateBookImageView(with image: UIImage) {
        bookImageView.image = image
    }

    func getBook(_ book: Item?) {
        guard let book = book else { return }

        bookTitleLabel.text = book.volumeInfo.title
        bookAuthorsLabel.text = book.volumeInfo.authors.first
        bookDescriptionLabel.text = book.volumeInfo.description
    }
}

// MARK: - Layout
private extension BookDetailsViewController {
    func layout() {
        layoutBackgroundView()
        layoutBookImageView()
        layoutBookTitleLabel()
        layoutBookAuthorsLabel()
        layoutBookDescriptionTitleLabel()
        layoutBookDescriptionLabel()
    }

    func layoutBackgroundView() {
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 140
            ),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func layoutBookImageView() {
        backgroundView.addSubview(bookImageView)
        NSLayoutConstraint.activate([
            bookImageView.leadingAnchor.constraint(
                equalTo: backgroundView.leadingAnchor,
                constant: 25
            ),
            bookImageView.topAnchor.constraint(
                equalTo: backgroundView.topAnchor,
                constant: -100
            ),
            bookImageView.heightAnchor.constraint(equalToConstant: 160),
            bookImageView.widthAnchor.constraint(equalToConstant: 130)
        ])
    }

    func layoutBookTitleLabel() {
        backgroundView.addSubview(bookTitleLabel)
        NSLayoutConstraint.activate([
            bookTitleLabel.leadingAnchor.constraint(
                equalTo: backgroundView.leadingAnchor,
                constant: 25
            ),
            bookTitleLabel.trailingAnchor.constraint(
                equalTo: backgroundView.trailingAnchor,
                constant: -25
            ),
            bookTitleLabel.topAnchor.constraint(
                equalTo: bookImageView.bottomAnchor,
                constant: 12
            )
        ])
    }

    func layoutBookAuthorsLabel() {
        backgroundView.addSubview(bookAuthorsLabel)
        NSLayoutConstraint.activate([
            bookAuthorsLabel.leadingAnchor.constraint(
                equalTo: backgroundView.leadingAnchor,
                constant: 25
            ),
            bookAuthorsLabel.trailingAnchor.constraint(
                equalTo: backgroundView.trailingAnchor,
                constant: -25
            ),
            bookAuthorsLabel.topAnchor.constraint(
                equalTo: bookTitleLabel.bottomAnchor,
                constant: 8
            )
        ])
    }

    func layoutBookDescriptionTitleLabel() {
        backgroundView.addSubview(bookDescriptionTitleLabel)
        NSLayoutConstraint.activate([
            bookDescriptionTitleLabel.leadingAnchor.constraint(
                equalTo: backgroundView.leadingAnchor,
                constant: 25
            ),
            bookDescriptionTitleLabel.trailingAnchor.constraint(
                equalTo: backgroundView.trailingAnchor,
                constant: -25
            ),
            bookDescriptionTitleLabel.topAnchor.constraint(
                equalTo: bookAuthorsLabel.bottomAnchor,
                constant: 16
            )
        ])
    }

    func layoutBookDescriptionLabel() {
        backgroundView.addSubview(bookDescriptionLabel)
        NSLayoutConstraint.activate([
            bookDescriptionLabel.leadingAnchor.constraint(
                equalTo: backgroundView.leadingAnchor,
                constant: 25
            ),
            bookDescriptionLabel.trailingAnchor.constraint(
                equalTo: backgroundView.trailingAnchor,
                constant: -25
            ),
            bookDescriptionLabel.topAnchor.constraint(
                equalTo: bookDescriptionTitleLabel.bottomAnchor,
                constant: 8
            )
        ])
    }
}
