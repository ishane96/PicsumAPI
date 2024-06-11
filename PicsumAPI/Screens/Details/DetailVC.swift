//
//  DetailVC.swift
//  PicsumAPI
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var addToFavrtsBtn: UIBarButtonItem!
    
    var image: Image?
    var session: URLSessionDataTask?
    var isSaveTapped = false
    var offlineImg: ImageEntity?
    var isOffline: Bool!
    var imageData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkExisitingObject()
    }
    
    func setupUI(){
        if isOffline{
            self.imageView?.image = UIImage(data: (self.offlineImg?.image)!)
            self.authorLbl.text = self.offlineImg?.author
            if #available(iOS 16.0, *) {
                self.addToFavrtsBtn.isHidden = true
            } else {
                self.addToFavrtsBtn.isEnabled = false
                // Fallback on earlier versions
            }
        } else {
            self.authorLbl.text = self.image?.author
        }
        getImage()
    }
    
    func checkExisitingObject(){
        if CoreDataHelper.shared.checkExist(id: image?.id ?? "") {
            self.addToFavrtsBtn.image = UIImage(systemName: "star.fill")
            self.addToFavrtsBtn.isEnabled = false
        }
    }
    
    func getImage(){
        
        image?.getImage { [weak self] success, message, data in
            guard let self = self else {return}
            if success {
                DispatchQueue.main.async {
                    self.imageView?.image = UIImage(data: data!)
                }
            } else {
                self.alert(title: "Alert", message: message)
            }
        }
    }
    
    @IBAction func addToFavouritesBtnActn(_ sender: Any) {
        image?.getImage {[weak self] success, message, data in
            guard let self = self else {return}
            if success {
                DispatchQueue.main.async {
                    
                    _ = CoreDataHelper.shared.saveToCoreData(id: self.image!.id, data: data!, author: self.image!.author, completion: { success, message in
                        if success {
                            self.checkExisitingObject()
                            self.alert(title: "Success", message: "Added to Favourites")
                        } else {
                            self.alert(title: "Error", message: message)
                        }
                    })
                }
            } else {
                self.alert(title: "Error", message: message)
            }
        }
    }
    
}
