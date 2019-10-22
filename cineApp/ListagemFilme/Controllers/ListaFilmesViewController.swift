//
//  ListaFilmesViewController.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import UIKit
import Kingfisher


class ListaFilmesViewController: UIViewController {

    @IBOutlet weak var filmeCollectionView: UICollectionView!
    var filmeService: FilmeService!
    var filmes: [FilmeView] = []
    var pagina: Int = 1
    var searchTimer: Timer?
    
    let searchController = UISearchController(searchResultsController: nil)
    var letra = "A"
    
    var isFinished = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filmeService = FilmeService(delegate: self)
        
        self.title = "Filmes"
        
        self.searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Procurar filmes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        self.searchController.searchBar.delegate = self
        
        self.filmeCollectionView.delegate = self
        self.filmeCollectionView.dataSource = self
        
        self.filmeCollectionView.register(cellType: FilmeCollectionViewCell.self)
        
        self.filmeService.getFilmes(pesquisa: self.letra, paginacao: 1)
        self.filmes = FilmeViewModel.getFilmes()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        view.backgroundColor = .black
        self.filmeCollectionView.backgroundColor = .black
        
        self.navigationItem.setHidesBackButton(true, animated: false)

    }
    

   
}

extension ListaFilmesViewController : FilmeServiceDelegate {
    
    func success(isFinished: Bool) {
        self.isFinished = isFinished
        self.filmes = FilmeViewModel.getFilmes()
        print(filmes)
        self.filmeCollectionView.reloadData()
    }
    
    func failure(erro: String, isFinished: Bool) {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = StoryboardScene.FilmeDetalhe.filmeDetalhe.instantiate()
        viewController.modalPresentationStyle = .overFullScreen
        viewController.filmeDet = FilmeViewModel.getFilme(by: filmes[indexPath.row].id)
        
//        self.present(UINavigationController(rootViewController: viewController), animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true
        
        
        
        )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 20)/2, height: (view.frame.width - 50) )
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let ultimoItem = filmes.count - 1
        if indexPath.row == ultimoItem && !self.isFinished {
            self.pagina += 1
            self.filmeService.getFilmes(pesquisa: self.letra, paginacao: pagina)
        }
    }
}

extension ListaFilmesViewController : UISearchControllerDelegate, UISearchBarDelegate {
    
    func willDismissSearchController(_ searchController: UISearchController) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchTimer?.invalidate()
        
        if let text = searchController.searchBar.text {
            
            self.searchTimer = Timer.scheduledTimer(timeInterval: 0.7, target: self,
                                                    selector: #selector(ListaFilmesViewController.search(_:)),
                                                    userInfo: text,
                                                    repeats: false)
        }
    }
    
    @objc func search(_ timer: Timer) {
        if let text = timer.userInfo as? String {
            self.letra = text
            self.filmeService.getFilmes(pesquisa: self.letra, paginacao: 1)
        }
    }

}


