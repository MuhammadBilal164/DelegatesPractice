//
//  MainVC.swift
//  Task3
//
//  Created by Umer Farooq on 22/09/2020.
//  Copyright © 2020 Umer Farooq. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //MARK: - Variable
    let tableViewNib = "tableCell"
    let cellIdentifier = "cell"
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    
    //MARK: - SetupView
    private func setupView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: tableViewNib, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    
    
    //MARK: - Helper Methods
    func showalert(tableindex: Int, CvIndex: Int) {
        
        // create the alert
        let alert = UIAlertController(title: "Details", message: "Table cell\(tableindex)\n Collection View Cell \(CvIndex)", preferredStyle: .alert)
        
        // add an action
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true)
    }
}



//MARK: - UITableViewDataSource & Delegate
extension MainVC: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Table view index"+String(indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}



//MARK: - TableViewCellDelegate
extension MainVC: TableViewCellDelegate {
    func tableViewCellIndex(cell: tableCell, collectionViewCellIndexNumber: Int) {
        
        if let tableViewCellIndex = tableView.indexPath(for: cell) {
            print("TableViewCell: \(tableViewCellIndex.row) CollectionVeiewCell: \(collectionViewCellIndexNumber)")
            self.showAlertToUser(title: "Message 😀", message: "TableViewCellIndex: \(tableViewCellIndex.row) CollectionViewCellIndex: \(collectionViewCellIndexNumber)", buttonTitle: "Dismiss")

        }
    }
}
