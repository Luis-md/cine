//
//  ListaFilmesViewController.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit


class ListaFilmesViewController: UIViewController {

    var filmeService: FilmeService!
    var filmes: [FilmeView] = []
    var pagina: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filmeService = FilmeService(delegate: self)
        
        self.filmeService.getFilmes(pesquisa: "A", paginacao: 1)
        // Do any additional setup after loading the view.
        self.filmes = FilmeViewModel.getFilmes()
        print(filmes)
    }
    

   
}

extension ListaFilmesViewController : FilmeServiceDelegate {
    func success() {
        self.filmes = FilmeViewModel.getFilmes()
        print(filmes)
    }
    
    func failure(erro: String) {
        print(erro)
    }
    
    
}
