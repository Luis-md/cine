//
//  Filme.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Filme: Object, Mappable {
    
    var id = RealmOptional<Int>()
    @objc dynamic var titulo: String?
    @objc dynamic var resumo: String?
    @objc dynamic var lancamento: String?
    var nota = RealmOptional<Double>()
    @objc dynamic var img: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        
        self.init()
    }
    
    func mapping(map: Map) {
        
        self.id.value       <- map["id"]
        self.titulo         <- map["original_title"]
        self.resumo         <- map["overview"]
        self.lancamento     <- map["release_date"]
        self.nota.value     <- map["vote_average"]
        self.img            <- map["poster_path"]
    }
    

    
}
