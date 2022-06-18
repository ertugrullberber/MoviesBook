//
//  ContentView.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 30.05.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var theMovieToLookFor = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        
    }
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                
            TextField("Search", text: $theMovieToLookFor, onEditingChanged: {_ in}, onCommit:{
                self.movieListViewModel.MovieSearchDo(movieName: theMovieToLookFor)
                
            }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
            
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
        }.navigationTitle(Text("Movie Archive"))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
