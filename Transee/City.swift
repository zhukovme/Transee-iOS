//
//  City.swift
//  Transee
//
//  Created by Michael on 13/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct City {
    let id: String
}

extension City: Decodable {
    static func create(id: String) -> City {
        return City(id: id)
    }
    
    static func decode(json: JSON) -> Decoded<City> {
        return City.create
            <^> json <| "id"
    }
}