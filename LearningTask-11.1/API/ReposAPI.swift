//
//  ReposAPI.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import Foundation

class ReposAPI {
    
    var session: URLSession
    var decoder: JSONDecoder
    
    var dataTask: URLSessionDataTask?
    
    init(session: URLSession = .shared,
         decoder: JSONDecoder = .init(dateDecodingStrategy: .iso8601)) {
        self.session = session
        self.decoder = decoder
    }
    
    func getAll(by user: User,
                completionHandler: @escaping ([Repo]) -> Void,
                failureHandler: @escaping (ReposAPI.Error) -> Void) {
        dataTask?.cancel()
        
        let uri = URL(string: "https://api.github.com/users/\(user.username)/repos")!
        
        dataTask = session.dataTask(with: uri) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    failureHandler(.unableToRequest(error))
                }
                return
            }
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                DispatchQueue.main.async {
                    failureHandler(.failureToFetch)
                }
                return
            }
            
            do {
                guard let self = self else { return }
                
                let repos = try self.decoder.decode([Repo].self, from: data)
                
                DispatchQueue.main.async {
                    completionHandler(repos)
                }
                
            } catch let error {
                print(error)
                
                DispatchQueue.main.async {
                    failureHandler(.invalidData)
                }
            }
            
        }
        
        dataTask?.resume()
    }
    
}

extension ReposAPI {
    
    enum Error: Swift.Error, LocalizedError {
        case unableToRequest(Swift.Error)
        case failureToFetch
        case invalidData
        
        var errorDescription: String? {
            switch self {
            case .unableToRequest(let error):
                return "Erro ao processar requisição \(error.localizedDescription)."
                
            case .failureToFetch:
                return "Erro ao receber resposta do servidor."
                
            case .invalidData:
                return "Os dados recebidos do servidor são inválidos."
            }
        }
    }
    
}
