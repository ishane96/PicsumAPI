//
//  File.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-04.
//

import UIKit

class APIs{
    
    static let shared = APIs()
    var urlSession: URLSession
    init(urlSession: URLSession = .shared){
        self.urlSession = urlSession
    }
    
    
    func getAllData<T: Decodable>(url: URL, _ mapType: T.Type, completion: @escaping (_ response: T?,
                                                                                      _ message: String?,
                                                                                      _ error: Error?) -> Void){
        if NetworkReachability.isInternetAvailable(){
            let task = urlSession.dataTask(with: url) { data, response, error in
                do{
                    if error == nil {
                        let data = data ?? Data()
                        let response =  try JSONDecoder().decode(T.self, from: data)
                        completion(response, "", nil)
                    } else {
                        completion(nil, error?.localizedDescription, nil)
                    }
                }catch {
                    completion(nil, error.localizedDescription, nil)
                }
                
            }
            task.resume()
        } else {
            completion(nil, "Internet Connection appears offline", nil)
        }
    }
    
    func getImageData(url: URL, completion: @escaping CompletionHandlerWithData){
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            
            if data?.count ?? 0 > 0 {
                if let data = data {
                    completion(true, "success", data)
                } else {
                    completion(false, error?.localizedDescription ?? "Failed", nil)
                }
            } else {
                completion(false, error?.localizedDescription ?? "Failed", nil)
            }
        }
        task.resume()
    }
    
}
