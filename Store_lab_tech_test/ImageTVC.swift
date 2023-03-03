//
//  ImageTVC.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit

class ImageTVC: UITableViewCell {

    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    var session: URLSessionDataTask?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        imageVw.image = nil
        session?.cancel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(image: Image){
        nameLbl.text = image.author
      session =  image.getImage {[weak self] success, message, data in
            guard let self = self else {return}
            if success{
                DispatchQueue.main.async {
                    self.imageVw.image = UIImage(data: data!)
                }
              
            }
        }
        session?.resume()
    }
    
}
