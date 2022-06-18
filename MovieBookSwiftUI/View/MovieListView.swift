//
//  ContentView.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 30.05.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.MovieSearchDo(movieName: "acti")
    }
    
    
    var body: some View {
        List(movieListViewModel.movies, id: \.imdbId) { movie in
            HStack{
                Image("placeholder")
                    .frame(width: 100, height: 150)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
