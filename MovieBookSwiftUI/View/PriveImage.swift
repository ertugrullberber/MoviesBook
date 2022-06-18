//
//  PriveImage.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 18.06.2022.
//

import SwiftUI

struct PriveImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url:String) {
        self.url = url
        self.imageDownloaderClient.imageDownload(url: self.url)
    }
    
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImages {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
    } else {
        return Image("placeholder")
            .resizable()
    }
    }
}

struct PriveImage_Previews: PreviewProvider {
    static var previews: some View {
        PriveImage(url: "https://m.media-amazon.com/images/M/MV5BMjI2MzU2NzEzN15BMl5BanBnXkFtZTcwMzI5NTU3Nw@@._V1_SX300.jpg")
    }
}
