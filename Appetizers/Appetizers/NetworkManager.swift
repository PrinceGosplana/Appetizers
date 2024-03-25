//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Oleksandr Isaiev on 24.03.2024.
//

import Foundation

final class NetworkManager {

    static let shared = NetworkManager()

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"

    private init() {}

    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {

        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in

            let result: Result<[Appetizer], APError>

            defer {
                completed(result)
            }

            if error != nil {
                result = .failure(.unableToComplete)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                result = .failure(.invalidResponse)
                return
            }

            guard let data else {
                result = .failure(.invalidData)
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodeResponse = try decoder.decode(AppetizerResponse.self, from: data)
                result = .success(decodeResponse.request)
            } catch {
                result = .failure(.invalidData)
            }
        }
        task.resume()
    }

}
