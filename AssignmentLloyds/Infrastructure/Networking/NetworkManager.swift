//
//  NetworkManager.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 12/1/23.
//

import Foundation

typealias Response<T: Decodable> = (Result<T, Error>) -> Void

protocol INetworkManager {
    func request<T: Decodable>(fromUrl url: URL, completion: @escaping Response<T>)
}

final class NetworkManager: INetworkManager {
    
    private let session: URLSession
    
    static let initObject: INetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(fromUrl url: URL, completion: @escaping Response<T>) {
        let completion: Response<T> = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let _ = error {
                return completion(.failure(NetworkError.badRequest))
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                return completion(.failure(NetworkError.noResponse))
            }
            if urlResponse.statusCode != 200 {
                return completion(.failure(NetworkError.failed))
            }
            guard let data = data else {
                return completion(.failure(NetworkError.noData))
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(NetworkError.unableToDecode))
            }
        }
        task.resume()
    }
}
