//
//  ImageDownloaderClient.swift
//  MovieBookSwiftUI
//
//  Created by Ertugrul Berber on 18.06.2022.
//

import Foundation


class ImageDownloaderClient: ObservableObject {
    
    @Published var downloadedImages : Data?
    
    func imageDownload(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) {(data, response , error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.downloadedImages = data
            }
            
            
             
        }.resume()
    }
}
