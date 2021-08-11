//
//  Created by Peter Combee on 22/07/2021.
//

import Foundation

fileprivate let ApiKey = "aff4d347-992b-40cb-a6e7-ab69c915fed2"
fileprivate let ApiURL = URL(string: "https://api.thecatapi.com/v1")!


struct RemoteCatService: CatService {

    var jsonDecoder: JSONDecoder = .init()
    
    func fetchBreeds() async throws -> [Breed] {
        let data = try await performRequest(path: "breeds")
        return try jsonDecoder.decode([Breed].self, from: data)
    }
    
    func fetchCategories() async throws -> [Category] {
        let data = try await performRequest(path: "categories")
        return try jsonDecoder.decode([Category].self, from: data)
    }
        
    func fetchCatImageURLs(filter: CatFilter, page: Int, pageSize: Int) async throws -> [Image] {
        switch filter {
        case .breed(let breed):
            let params = [
                "breed_ids" : breed.id,
                "page" : String(page),
                "limit" : String(pageSize)
            ]
            let data = try await performRequest(path: "images/search", params: params)
            return try jsonDecoder.decode([Image].self, from: data)
        case .category(let category):
            let params = [
                "category_ids" : String(category.id),
                "page" : String(page),
                "limit" : String(pageSize)
            ]
            let data = try await performRequest(path: "images/search", params: params)
            return try jsonDecoder.decode([Image].self, from: data)
        }
    }
    
    fileprivate func performRequest(
        path: String,
        params: [String : String] = [:]
    ) async throws -> Data {
        guard let url = urlComponents(path: path, params: params).url else {
            fatalError("Troep!")
        }
        let (data, response) = try await URLSession.shared.data(for: request(url: url))
        print(response)
        print(data)
        print(response)
        print(try JSONSerialization.jsonObject(with: data))
        return data
    }
    
    private func urlComponents(path: String, params: [String: String]) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.thecatapi.com"
        components.path = "/v1/" + path
        components.queryItems = params.map {
            .init(name: $0, value: $1)
        }
        return components
    }
    
    private func request(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(ApiKey, forHTTPHeaderField: "x-api-key")
        return request
    }
    
}
