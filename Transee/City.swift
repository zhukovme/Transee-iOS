//
//  City.swift
//  Transee
//
//  Created by Michael on 14/06/15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import Argo
import Runes

struct City {
    let id: String
    
    var name: String {
        get {
            return (Cities.citiesDict as NSDictionary).allKeysForObject(id).first as! String
        }
    }
}

extension City: Decodable {
    static func create(id: String) -> City {
        return City(id: id)
    }
    
    static func decode(json: JSON) -> Decoded<City> {
        switch json {
            case let .String(s):
                return City.create
                    <^> .fromOptional(s)
        default:
            return .TypeMismatch("\(json) is not an String")
        }
    }
}
