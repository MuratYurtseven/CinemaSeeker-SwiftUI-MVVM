//
//  ImageNetwork.swift
//  CinemaSeeker
//
//  Created by Murat on 13.05.2024.
//

import SwiftUI

class ImageNetwork: ObservableObject {
    private let cache = NSCache<NSString,UIImage>()
    
    @Published var image: UIImage?
    
    func downloandImage(from urlString: String) -> UIImage? {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            self.image = image
            return self.image
        }
        
        let url = MovieAPI.image(imagePath: urlString)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {return}
            
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {return}
            
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                self.image = image
                
            }
        }
        task.resume()
        return self.image
        
    }
    
}
