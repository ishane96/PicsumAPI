//
//  Image.swift
//  PicsumAPI
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit

struct Image: Codable {
    let id, author: String
    let downloadURL, url: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, url
        case downloadURL = "download_url"
    }
    
    func getImage(completion: @escaping CompletionHandlerWithData) {
        
        guard let imageURL = URL(string: downloadURL) else {
            completion(false,"Failed", nil)
            return
        }
        
        APIs.shared.getImageData(url: imageURL) { success, message, data in
            if success {
                completion(true, "", data)
            } else{
                completion(false, message, nil)
            }
            
        }
    }
}
