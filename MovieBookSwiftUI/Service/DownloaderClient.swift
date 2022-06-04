//
//  DownloaderClient.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 31.05.2022.
//

import Foundation


class DownloaderClient {
    
    func DownloadMovie(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=86417447") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data, error == nil else {
            return completion(.failure(.dontComeData))
        }
        
        guard let movieAnswer = try? JSONDecoder().decode(ComingMovies.self, from: data) else {
            return completion(.failure(.dataNotProcessed))
        }
        completion(.success(movieAnswer.movies))
    }.resume()
    }
    }
    


enum DownloaderError : Error {
    case wrongUrl
    case dontComeData
    case dataNotProcessed
}
