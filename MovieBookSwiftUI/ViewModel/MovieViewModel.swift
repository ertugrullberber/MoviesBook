//
//  MovieViewModel.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 4.06.2022.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func MovieSearchDo(movieName: String) {
        downloaderClient.DownloadMovies(search: movieName) { (result) in
            switch result {
            case.failure(let hata):
                print(hata)
                
            case .success(let movieList):
                if let movieList = movieList {
                    DispatchQueue.main.async {
                        self.movies = movieList.map(MovieViewModel.init)
                    }
                }
            }
        }
    }
}

struct MovieViewModel {
    
    let movie : Movie
    
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
    
}
