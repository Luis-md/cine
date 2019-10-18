//
//  FilmeDetalhe.swift
//  cineApp
//
//  Created by Luis_md on 18/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit

class FilmeDetalhe: UIViewController {
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var sinopseLabel: UILabel!
    @IBOutlet weak var lancamentoLabel: UILabel!
    @IBOutlet weak var notaLabel: UILabel!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var viewTransparente: UIView!
    
    var titulo = ""
    var sinopse = ""
    var lancamento = ""
    var nota = ""
    var posterImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        
        self.tituloLabel.text = self.titulo
        self.sinopseLabel.text = self.sinopse
        self.lancamentoLabel.text = self.lancamento
        self.notaLabel.text = self.nota
        if let foto = self.posterImg {
            self.poster.image = foto
        }
        self.viewTransparente.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
