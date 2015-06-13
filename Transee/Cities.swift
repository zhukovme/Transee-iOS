//
//  Cities.swift
//  Transee
//
//  Created by Michael on 06.06.15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct CitiesVars {
    static var citiesDict = ["Астрахань": "astrakhan", "Барнаул": "barnaul", "Великий Новгород": "veliky_novgorod", "Владивосток": "vladivostok", "Владимир": "vladimir", "Воронеж": "voronezh", "Кострома": "kostroma", "Ярославль": "yaroslavl"]
    
    static var currentCity: String = ""
}

struct Cities {
    let items: [City]
}

extension Cities: Decodable {
    static func create(items: [City]) -> Cities {
        return Cities(items: items)
    }
    
    static func decode(json: JSON) -> Decoded<Cities> {
        return Cities.create
            <^> json <|| "items"
    }
}
