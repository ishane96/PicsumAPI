//
//  ViewControllerExtensions.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-04.
//

import UIKit

extension UIViewController {
    
    //AlertController
    func alert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


