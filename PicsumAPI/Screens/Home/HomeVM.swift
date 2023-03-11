//
//  HomeVM.swift
//  PicsumAPI
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit
import CoreData

class HomeVM {
    
    var images: [Image] = []
    var urlSession: URLSession
    init(urlSession: URLSession = .shared){
        self.urlSession = urlSession
    }
    var page = 1
    var isFetching = false
    var isPagingCompleted = false
    
    func getImageList(completion: @escaping CompletionHandler){
        let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=10")!
        
        APIs.shared.getAllData(url: url, [Image].self) {[weak self] response, message, error in
            guard let self = self else {return}
            guard let response = response else {
                completion(false, message!)
                return
            }
            do {
                if error == nil {
                    self.images.append(contentsOf: response)
                    if 10 > response.count {
                        self.isPagingCompleted = true
                    }
                    completion(true, "")
                } else {
                    completion(false, message ?? "Failed")
                }
            }
        }
    }
    
    
}
