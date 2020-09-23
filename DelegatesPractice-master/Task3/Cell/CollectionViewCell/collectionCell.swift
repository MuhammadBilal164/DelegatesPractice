//
//  collectionCell.swift
//  Task3
//
//  Created by Umer Farooq on 22/09/2020.
//  Copyright © 2020 Umer Farooq. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func collectionViewCellIndex(cell: collectionCell)
}

class collectionCell: UICollectionViewCell {
    
    
    
    //MARK: - Outlets
    
    
    
    //MARK: - Variables
    weak var delegate: CollectionViewCellDelegate?

    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    //MARK: - Actions
    @IBAction func collectionViewCellButtonTapped(_ sender: UIButton) {
        delegate?.collectionViewCellIndex(cell: self)
    }
}
