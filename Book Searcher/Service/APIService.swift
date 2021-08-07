//
//  APIService.swift
//  Book Searcher
//
//  Created by Khushvaktov Temur on 06.08.2021.
//

import UIKit

/// Protocol for network layer
protocol APIServiceProtocol {
    /// Method to get books from service
    /// - Parameters:
    ///   - urlString: URL to get data from service
    ///   - completion: result
    func getBooksFrom(
        urlString: String,
        completion: @escaping (Result<Book, Error>) -> Void
    )
}

/// Network Layer
final class APIService: APIServiceProtocol {

    /// Method to get books from service
    /// - Parameters:
    ///   - urlString: URL to get data from service
    ///   - completion: result
    func getBooksFrom(
        urlString: String,
        completion: @escaping (Result<Book, Error>
        ) -> Void)
    {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            {
                do {
                    let book = try JSONDecoder().decode(Book.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(book))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
