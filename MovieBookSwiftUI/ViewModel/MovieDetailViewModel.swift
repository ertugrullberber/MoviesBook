//
//  MovieDetailViewModel.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 18.06.2022.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetail : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func movieDetailGet(imdbId : String) {
        downloaderClient.MovieDetailDownload(imdbId: imdbId) {(result) in
            switch result {
            case .failure(let error) :
                print(error)
            case .success(let movieDetail) :
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailsViewModel(detail: movieDetail)
                }
            }
        }
    }
}


struct MovieDetailsViewModel {
    
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    var awards : String{
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
}
