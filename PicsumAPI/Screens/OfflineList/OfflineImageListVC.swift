//
//  OfflineImageList.swift
//  PicsumAPI
//
//  Created by Achintha kahawalage on 2023-03-03.
//

import UIKit

class OfflineImageListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var imageArr: [ImageEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.imageArr = CoreDataHelper.shared.fetchData()
        tableView.reloadData()
    }
    
    func setupUI(){
        tableView.register(UINib(nibName: "ImageTVC", bundle: nil), forCellReuseIdentifier: "imageTVC")
    }
    
}

extension OfflineImageListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageTVC") as! ImageTVC
        
        cell.setupOfflineCell(image: self.imageArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "offlineSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailVC, let index = sender as? Int{
            vc.offlineImg = self.imageArr[index]
            vc.isOffline = true
        }
    }
    
}
