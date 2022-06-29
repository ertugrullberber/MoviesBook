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
        ZStack{
            NavigationView{
                VStack{
                TextField("Search", text: $theMovieToLookFor, onEditingChanged: {_ in}, onCommit:{
                    self.movieListViewModel.MovieSearchDo(movieName: theMovieToLookFor.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? theMovieToLookFor)
                    
                }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
            List(movieListViewModel.movies, id: \.imdbId) { movie in
                NavigationLink(destination: DetailView(imdbId: movie.imdbId),
                               label: {
                    HStack(){
                        PriveImage(url: movie.poster)
                            .frame(width: 90, height: 130)
                            .shadow(radius: 10)
                        
                        VStack(alignment: .leading){
                            Text(movie.title)
                                .font(.title2)
                                .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                                .padding(1)
                            
                            Text(movie.year)
                                .font(.title3)
                                .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                                .padding(1)
                        }
                            
                    }
                }).listRowBackground(Color(red: 1.00, green: 0.95, blue: 0.74))
                
            }.navigationTitle(Text("Movie Archive"))
    
                        
                }.background(Color(red: 1.00, green: 0.95, blue: 0.74))
            }
            
        }
        
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
