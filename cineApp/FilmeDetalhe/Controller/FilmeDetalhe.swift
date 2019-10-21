//
//  FilmeDetalhe.swift
//  cineApp
//
//  Created by Luis_md on 18/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit
import Kingfisher

class FilmeDetalhe: UIViewController {
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var sinopseLabel: UILabel!
    @IBOutlet weak var lancamentoLabel: UILabel!
    @IBOutlet weak var notaLabel: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var viewTransparente: UIView!
    
    var filmeDet: FilmeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        if let filme = filmeDet {
            self.tituloLabel.text = filme.titulo
            self.sinopseLabel.text = filme.resumo
            self.lancamentoLabel.text = filme.lancamento
            self.notaLabel.text = String(filme.nota)
            self.poster.kf.setImage(with: filme.imgURL)
        }
        
        self.viewTransparente.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        self.hideViewController()
    }
    
    
    
    
}
