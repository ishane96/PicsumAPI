//
//  HomeVM.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit

typealias CompletionHandler = (_ status: Bool, _ message: String) -> ()
typealias CompletionHandlerWithData = (_ status: Bool, _ message: String, _ data: Data?) -> ()

class HomeVM {
    
    var images: [Image] = []
    var urlSession: URLSession
    init(urlSession: URLSession = .shared){
        self.urlSession = urlSession
    }
    var page = 1
    var isFetching = false
    var isPagingCompleted = false
    
    func loadAll(completion: @escaping CompletionHandler) {
        let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=10")!
        
        let task = self.urlSession.dataTask(with: url) { data, resp, error in
            guard error == nil else {
                completion(false, error?.localizedDescription ?? "Error")
                return
            }
            do {
                let data = data ?? Data()
                let response = try JSONDecoder().decode([Image].self, from: data)
                self.images.append(contentsOf: response)
//                self.nextPageToken = response.
                if 10 > response.count {
                    self.isPagingCompleted = true
                }
                completion(true,"")
            } catch {
                completion(false, error.localizedDescription)
            }
        }
        task.resume()
    }
}
