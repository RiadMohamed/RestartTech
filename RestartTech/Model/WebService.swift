//
//  WebService.swift
//  RestartTech
//
//  Created by Riad Mohamed on 17/03/2021.
//

import Foundation

enum NetworkError: Error {
    case JSONParingError
    case urlParsingError
    case networkingError
}

enum HTTP: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    var url: URL
    var http: HTTP = .get
    var body: Data? = nil
}


class Webservice {
    
    static let shared = Webservice()
    
    private init() {}
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void ) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.http.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let safeData = data else {
                completion(.failure(.networkingError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: safeData)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
                
            } catch  {
                completion(.failure(.JSONParingError))
            }
        }.resume()
    }
}
