//
//  DetailView.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 18.06.2022.
//

import SwiftUI


struct DetailView: View {
    
    
    let imdbId : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack{
            Text(movieDetailViewModel.movieDetail?.plot ?? "Plot Gosterilecek")
        }.onAppear(perform: {
            self.movieDetailViewModel
                .movieDetailGet(imdbId: imdbId)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
