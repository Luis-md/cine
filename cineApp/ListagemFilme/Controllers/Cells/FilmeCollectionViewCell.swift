//
//  FilmeCollectionViewCell.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit

class FilmeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var nota: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
