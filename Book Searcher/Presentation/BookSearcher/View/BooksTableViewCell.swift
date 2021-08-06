//
//  BooksTableViewCell.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit
import Kingfisher

/// Cell for showing book image, title, author
final class BooksTableViewCell: UITableViewCell {

    // MARK: - Private Properties
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bookImageView: UIImageView = {
        let imageView = UIImageView()
        let imageName = "Unknown"
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bookAuthorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods
    /// Cell configuration
    /// - Parameter item: item with info about book
    func configureCell(with item: Item) {
        bookTitleLabel.text = item.volumeInfo.title
        bookAuthorLabel.text = item.volumeInfo.authors.first

        let url = URL(string: item.volumeInfo.imageLinks.thumbnail)
        bookImageView.kf.indicatorType = .activity
        bookImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder")
        )
    }
}

// MARK: - Layout
private extension BooksTableViewCell {
    func layout() {
        layoutContainerView()
        layoutBookImageView()
        layoutBookTitleLabel()
        layoutBookAuthorLabel()
    }

    func layoutContainerView() {
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 4
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -16
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -4
            )
        ])
    }

    func layoutBookImageView() {
        containerView.addSubview(bookImageView)
        NSLayoutConstraint.activate([
            bookImageView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: 8
            ),
            bookImageView.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 8
            ),
            bookImageView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -8
            ),
            bookImageView.widthAnchor.constraint(
                equalTo: bookImageView.heightAnchor
            )
        ])
    }

    func layoutBookTitleLabel() {
        containerView.addSubview(bookTitleLabel)
        NSLayoutConstraint.activate([
            bookTitleLabel.leadingAnchor.constraint(
                equalTo: bookImageView.trailingAnchor,
                constant: 8
            ),
            bookTitleLabel.topAnchor.constraint(
                equalTo: containerView.topAnchor,
                constant: 14
            ),
            bookTitleLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -8
            )
        ])
    }

    func layoutBookAuthorLabel() {
        containerView.addSubview(bookAuthorLabel)
        NSLayoutConstraint.activate([
            bookAuthorLabel.leadingAnchor.constraint(
                equalTo: bookImageView.trailingAnchor,
                constant: 8
            ),
            bookAuthorLabel.topAnchor.constraint(
                equalTo: bookTitleLabel.bottomAnchor,
                constant: 8
            ),
            bookAuthorLabel.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: -8
            )
        ])
    }
}
