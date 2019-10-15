//
//  FilmesViewModel.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import Foundation
import RealmSwift
import Kingfisher


struct FilmeView {
    var id = 0
    var titulo = ""
    var resumo = ""
    var lancamento = ""
    var nota = 0.0
    var img = ""
    
    var imgURL: URL? {
        
        return URL(string: imgUrl + self.img)
    }
}

class FilmeViewModel {
    
    
    static func saveAll(objects: [Filme]) {
        
        try? uiRealm.write {
            uiRealm.add(objects, update: .all)
        }
    }
    
    static func getAsView (filme: Filme?) -> FilmeView {
        guard let filme = filme else {
            
            return FilmeView()
        }
        
        var filmeView = FilmeView()
        filmeView.id = filme.id.value ?? 0
        filmeView.lancamento = filme.lancamento ?? ""
        filmeView.nota = filme.nota.value ?? 0
        filmeView.resumo = filme.resumo ?? ""
        filmeView.titulo = filme.titulo ?? ""
        filmeView.img = filme.img ?? ""
        
        return filmeView
    }
    
    //-----------------
    
    static func getAsView(filmes: [Filme]) -> [FilmeView] {
        
        var filmeView: [FilmeView] = []
        
        filmes.forEach { (filme) in
            
            filmeView.append(self.getAsView(filme: filme))
        }
        return filmeView
    }
    
    //-----------------
    //Lendo os objetos já salvos no Realm
    static func get() -> [Filme] {
        let results = uiRealm.objects(Filme.self)
        
        var filmes: [Filme] = []
        
        filmes.append(contentsOf: results)
        
        return filmes
    }
    
    //-----------------
    
    static func getFilmes() -> [FilmeView] {
        
        return self.getAsView(filmes: self.get())
    }
}
