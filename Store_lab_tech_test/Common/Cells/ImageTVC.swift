//
//  ImageTVC.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit

class ImageTVC: UITableViewCell {
    
    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        imageVw.image = nil
    }
    
    func setupCell(image: Image){
        nameLbl.text = image.author
        activityIndicator.startAnimating()
        image.getImage {[weak self] success, message, data in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                if success {
                    self.imageVw.image = UIImage(data: data!)
                }
            }
        }
    }
    
    func setupOfflineCell(image: ImageEntity){
        activityIndicator.stopAnimating()
        imageVw.image = UIImage(data: image.image!)
        nameLbl.text = image.author
    }
    
}
