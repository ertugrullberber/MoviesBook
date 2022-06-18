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
        self.movieListViewModel.MovieSearchDo(movieName: "pulp")
    }
    
    
    var body: some View {
        NavigationView{
        List(movieListViewModel.movies, id: \.imdbId) { movie in
            HStack(){
                PriveImage(url: movie.poster)
                    .frame(width: 90, height: 130)
                    .shadow(radius: 10)
                
                VStack(alignment: .leading){
                    Text(movie.title)
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    Text(movie.year)
                        .font(.title3)
                        .foregroundColor(.orange)
                }
                    
            }
        }.navigationTitle(Text("Movie Search"))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
