//
//  ListaFilmesViewController.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit


class ListaFilmesViewController: UIViewController {

    @IBOutlet weak var filmeCollectionView: UICollectionView!
    var filmeService: FilmeService!
    var filmes: [FilmeView] = []
    var pagina: Int = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filmeService = FilmeService(delegate: self)
        
        self.filmeCollectionView.delegate = self
        self.filmeCollectionView.dataSource = self
        
        self.filmeCollectionView.register(cellType: FilmeCollectionViewCell.self)
        
        self.filmeService.getFilmes(pesquisa: "A", paginacao: 1)
        // Do any additional setup after loading the view.
        self.filmes = FilmeViewModel.getFilmes()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        view.backgroundColor = .black
        self.filmeCollectionView.backgroundColor = .black
        
    }
    

   
}

extension ListaFilmesViewController : FilmeServiceDelegate {
    func success() {
        self.filmes = FilmeViewModel.getFilmes()
        print(filmes)
        self.filmeCollectionView.reloadData()
    }
    
    func failure(erro: String) {
        print(erro)
    }
    
    
}


extension ListaFilmesViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filmes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as FilmeCollectionViewCell
        
        cell.bind(filme: self.filmes[indexPath.row])
        cell.tintColor = .lightGray
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 30)/2, height: (view.frame.width - 100) )
    }

}
