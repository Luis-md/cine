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
    func success()
    func failure(erro: String)
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
                    print(filmes)
                }
                self.delegate.success()
                
            case .failure(let error):
                self.delegate.failure(erro: error.localizedDescription)
            }
            
        })
        
    }
}
