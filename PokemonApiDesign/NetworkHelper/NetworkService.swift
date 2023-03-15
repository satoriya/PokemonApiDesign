//
//  NetworkService.swift
//  PokemonApiDesign
//
//  Created by Phincon on 15/03/23.
//

import Foundation

protocol ApiServiceProtocol {
    var url: URL! { get }
    func callApi<T:Decodable>(model: T.Type,on completion: @escaping (Result<T, Error>) -> Void, response: @escaping(URLResponse) -> Void)
}

struct ApiService: ApiServiceProtocol {
   
    var url: URL!
    init(url: URL) {
        self.url = url
    }
    
    func callApi<T>(model: T.Type, on completion: @escaping (Result<T, Error>) -> Void, response: @escaping (URLResponse) -> Void) where T : Decodable {
        URLSession.shared.dataTask(with: self.url) { data, response, error in
            guard let error = error else {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(T.self, from: data)
                        completion(.success(model))
                    } catch let parseError {
                        completion(.failure(parseError))
                    }
                }
                return
            }
            completion(.failure(error))
            
        }.resume()
    }
    

}
