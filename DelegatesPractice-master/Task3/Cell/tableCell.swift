//
//  tableCell.swift
//  Task3
//
//  Created by Umer Farooq on 22/09/2020.
//  Copyright © 2020 Umer Farooq. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func tableViewCellIndex(cell: tableCell, collectionViewCellIndexNumber: Int)
}



class tableCell: UITableViewCell {
    
    
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    //MARK: - Variables
    let cellIdentifier = "cell"
    weak var delegate: TableViewCellDelegate?
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    
    //MARK: - SetupView
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "collectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    
    
    //MARK: - Actions
    
    
    
    
    //MARK: - Helper Methods
    
}


//MARK: - UICollectionViewDelegate & DataSource
extension tableCell:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! collectionCell
        cell.delegate = self
        return cell
    }
}



//MARK: - CollectionViewCellDelegate
extension tableCell: CollectionViewCellDelegate {
    
    func collectionViewCellIndex(cell: collectionCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        delegate?.tableViewCellIndex(cell: self, collectionViewCellIndexNumber: indexPath.row)
    }
}
