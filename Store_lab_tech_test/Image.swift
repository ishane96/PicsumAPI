//
//  Image.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit

struct Image: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
    
    func getImage(completion: @escaping CompletionHandlerWithData) -> URLSessionDataTask? {
//        if let imageData = imageData {
//            completion(true, imageData)
//            return nil
//        }
        
        guard let imageURL = URL(string: downloadURL) else {
            completion(false,"nil", nil)
            return nil
        }
        
        let session = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
//            guard let strongSelf = self else {return}
            
            if let data = data {
                       completion(true, "", data)
                   }
        }
        return session
    }
}
