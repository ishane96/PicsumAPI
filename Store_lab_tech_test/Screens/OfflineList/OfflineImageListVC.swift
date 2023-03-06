//
//  OfflineImageList.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-03.
//

import UIKit

class OfflineImageListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ImageTVC", bundle: nil), forCellReuseIdentifier: "imageTVC")
        CoreDataHelper.shared.fetchData()
        tableView.reloadData()
    }
    
}

extension OfflineImageListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataHelper.shared.imageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageTVC") as! ImageTVC
        
        cell.setupOfflineCell(image: CoreDataHelper.shared.imageArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "offlineSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailVC, let index = sender as? Int{
            vc.offlineImg = CoreDataHelper.shared.imageArr[index]
            vc.isOffline = true
        }
    }
    
}
