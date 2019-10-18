//
//  FilmeService.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol FilmeServiceDelegate {
    func success(isFinished: Bool)
    func failure(erro: String, isFinished: Bool)
}

class FilmeService {
    
    var delegate: FilmeServiceDelegate!
    
    init(delegate: FilmeServiceDelegate) {
        
        self.delegate = delegate
    }
    
    func getFilmes(pesquisa: String, paginacao: Int) {
        
        FilmeRequestFactory.getFilmes(busca: pesquisa, pagina: paginacao).validate().responseArray(keyPath: "results", completionHandler: { (response: DataResponse<[Filme]>) in
            
            switch response.result {
            case .success:
                
                if let filmes = response.result.value {
                    
                    try? uiRealm.write {
                        if paginacao == 1 {
                            uiRealm.delete(uiRealm.objects(Filme.self))
                        }
                        uiRealm.add(filmes)
                    }
                    self.delegate.success(isFinished: filmes.isEmpty)
                } else {
                    self.delegate.success(isFinished: true)
                }
                
                
            case .failure(let error):
                self.delegate.failure(erro: error.localizedDescription, isFinished: true)
            }
            
        })
        
    }
}
