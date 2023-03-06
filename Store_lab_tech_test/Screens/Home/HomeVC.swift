//
//  ViewController.swift
//  Store_lab_tech_test
//
//  Created by Achintha kahawalage on 2023-03-02.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let vm = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        tableView.register(UINib(nibName: "ImageTVC", bundle: nil), forCellReuseIdentifier: "imageTVC")
        getData()
    }
    
    func getData(){
        vm.getImageList{[weak self] status, message in
            guard let self = self else {return}
            if status {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                self.alert(title: "Alert", message: message)
            }
        }
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageTVC") as! ImageTVC
        
        cell.setupCell(image: vm.images[indexPath.row])
        return cell
    }
    
    //Pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == vm.images.count - 5 && !vm.isFetching && !vm.isPagingCompleted{
            vm.page += 1
            getData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "onlineSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailVC, let index = sender as? Int{
            vc.image = vm.images[index]
            vc.isOffline = false
        }
    }
}

