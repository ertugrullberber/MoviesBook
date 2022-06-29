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
        ZStack{
            VStack(alignment:.leading) {
                HStack{
                    Spacer()
                PriveImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.38, alignment: .center)
                    Spacer()
                }
                HStack{
                    Text(movieDetailViewModel.movieDetail?.title ?? "Film ismi gosterilecek")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                        .font(.title2)
                        .padding()

                }
                Divider()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        Text(movieDetailViewModel.movieDetail?.plot ?? "Plot Gosterilecek")
                            .font(.body)
                            .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                            .fontWeight(.semibold)
                            .padding()
                    }.frame(width: 390, height: 120, alignment: .leading)
                    
                }.frame(width: 390, height: 100, alignment: .center)
                
                
                
                Divider()
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Actors: \(movieDetailViewModel.movieDetail?.detail.actors ?? "Aktor Gosterilecek")")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                                .fontWeight(.light)
                                .padding(15)
                        }
                        HStack{
                            Text("Author: \(movieDetailViewModel.movieDetail?.writer ?? "Yazar Gosterilecek")")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                                .fontWeight(.light)
                                .padding(15)
                        }
                        HStack{
                            Text("Rating: \(movieDetailViewModel.movieDetail?.detail.imdbRating ?? "Rating Gosterilecek")")
                                .font(.subheadline)
                                .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                                .fontWeight(.light)
                                .padding(15)
                        }
                        HStack{
                            Text("Year: \(movieDetailViewModel.movieDetail?.year ?? "Yil Gosterilecek")")
                                .font(.callout)
                                .foregroundColor(Color(red: 0.00, green: 0.05, blue: 0.26))
                                .fontWeight(.light)
                                .padding(15)
                        }
                        Spacer()
                    }
                }
                
            }.onAppear(perform: {
                self.movieDetailViewModel
                    .movieDetailGet(imdbId: imdbId)
            })
            .background(Color(red: 1.00, green: 0.95, blue: 0.74))
        }
                
            
        
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
