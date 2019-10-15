//
//  FilmeRequestFactory.swift
//  cineApp
//
//  Created by Luis_md on 14/10/19.
//  Copyright © 2019 Luis_md. All rights reserved.
//

import Foundation
import Alamofire

class FilmeRequestFactory {
    
    static func getFilmes(busca: String, pagina: Int) -> DataRequest {
        let params: [String : String] = ["query" : busca, "page" : String(pagina), "api_key" : apiKey]
        
        return Alamofire.request(baseUrl + "/search/movie", method: .get, parameters: params)
    }
}
