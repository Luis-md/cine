//
//  FilmeCollectionViewCell.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class FilmeCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var nota: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bind (filme: FilmeView) {
        
        self.titulo.text = filme.titulo
        self.nota.text = String(filme.nota)
        self.poster.kf.setImage(with: filme.imgURL)
    }

}
