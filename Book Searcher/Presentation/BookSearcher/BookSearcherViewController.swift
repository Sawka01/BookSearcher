//
//  BookSearcherViewController.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

/// Logic of displaying view to the user of event processing results
protocol BookSearcherProtocol: AnyObject {
    /// Successfully received book from server
    /// - Parameter book: book
    func successfullyReceived(book: Book)
}

/// Book search screen
final class BookSearcherViewController: UIViewController {

    // MARK: - Public Properties

    /// Link to presentation layer
    var presenter: BookSearcherPresenter?

    // MARK: - Private Properties
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private lazy var booksTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Please, enter your book name on search bar."
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var book: Book? {
        didSet {
            guard let _ = book else {
                titleLabel.isHidden = false
                return
            }
            titleLabel.isHidden = true
        }
    }

    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        layout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Find Books"
        searchBar.delegate = self

        setupBooksTableView()
    }

    // MARK: - Private Methods
    private func setupBooksTableView() {
        booksTableView.register(
            BooksTableViewCell.self,
            forCellReuseIdentifier: String(describing: BooksTableViewCell.self)
        )
        booksTableView.delegate = self
        booksTableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension BookSearcherViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return book?.items.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let book = book else { return UITableViewCell() }
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: BooksTableViewCell.self),
            for: indexPath
        ) as? BooksTableViewCell {

            cell.configureCell(with: book.items[indexPath.row])

            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension BookSearcherViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 100
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard let item = book?.items[indexPath.row] else { return }
        presenter?.openBookDetails(book: item)
    }
}

// MARK: - UISearchBarDelegate
extension BookSearcherViewController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(searchText)"
        presenter?.getBooksFrom(urlString: urlString)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setValue("Cancel", forKey: "cancelButtonText")
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
        book = nil
        booksTableView.reloadData()
    }
}

// MARK: - BookSearcherProtocol
extension BookSearcherViewController: BookSearcherProtocol {
    /// Successfully received book from server
    /// - Parameter book: book
    func successfullyReceived(book: Book) {
        DispatchQueue.main.async {
            self.book = book
            self.booksTableView.reloadData()
        }
    }
}

// MARK: - Layout
private extension BookSearcherViewController {
    func layout() {
        layoutSearchBar()
        layoutBooksTableView()
        layoutTitleLabel()
    }

    func layoutSearchBar() {
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            searchBar.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 10
            ),
            searchBar.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -10
            )
        ])
    }

    func layoutBooksTableView() {
        view.addSubview(booksTableView)
        NSLayoutConstraint.activate([
            booksTableView.topAnchor.constraint(
                equalTo: searchBar.bottomAnchor,
                constant: 0
            ),
            booksTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            booksTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            booksTableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            )
        ])
    }

    func layoutTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            titleLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
    }
}
