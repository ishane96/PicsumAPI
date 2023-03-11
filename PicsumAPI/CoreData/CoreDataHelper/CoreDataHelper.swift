//
//  CoreDataHelper.swift
//  PicsumAPI
//
//  Created by Achintha kahawalage on 2023-03-03.
//

import UIKit
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    var imageArr = [ImageEntity]()
    var context = CoreDataStack.shared.persistentContainer.viewContext
    
    
    func saveToCoreData(id: String, data: Data, author: String, completion: @escaping CompletionHandler) -> ImageEntity? {
        
        let imageInstance = ImageEntity(context: context)
        
        imageInstance.image = data
        imageInstance.author = author
        imageInstance.postID = id
        do {
            try context.save()
            completion(true, "")
            return imageInstance
           
        } catch {
            completion(false, error.localizedDescription)
            return nil
            
        }
        
    }
    
    func fetchData() -> [ImageEntity] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageEntity")
        
        do {
            imageArr = try context.fetch(fetchRequest) as! [ImageEntity]
            return imageArr
        } catch {
            print("Error while fetching the image")
            return []
        }
        
    }
    
    func checkExist(id: String) -> Bool{
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageEntity")
        let predicate = NSPredicate(format: "postID = %@", id)
        fetch.predicate = predicate
        
        do {
            let result = try context.fetch(fetch)
            if result.count > 0 {
                return true
            } else {
                return false
            }
        } catch {
            return false
        }
        
        return false
    }
}
