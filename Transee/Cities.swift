//
//  Cities.swift
//  Transee
//
//  Created by Michael on 06.06.15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

struct Cities {
    
    static var citiesDict = ["Астрахань": "astrakhan", "Барнаул": "barnaul", "Великий Новгород": "veliky_novgorod", "Владивосток": "vladivostok", "Владимир": "vladimir", "Воронеж": "voronezh", "Кострома": "kostroma", "Ярославль": "yaroslavl"]
    
    static var currentCity: String = ""
    
    var items: [City]!

    init(items: [City]) {
        self.items = items
    }
}
