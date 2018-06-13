//
//  Response.swift
//  AutoLayOut
//
//  Created by MDL on 6/12/18.
//  Copyright © 2018 fit. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class UserResponse: Mappable {
    
    var id : Int?
    var name : String?
    var username : String?
    var email : String?
    var address = [Address]()
    var phone : String?
    var website : String?
    var company = [Company]?.self
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map){
        id <- map ["id"]
        name <- map ["name"]
        username <- map ["username"]
        email <- map ["email"]
        address <- map ["address"]
        phone <- map ["phone"]
        website <- map ["website"]
        company <- map ["company"]
    }
}


class Address: Mappable{
    
    var street: String?
    var suite: String?
    var zipcode: String?
    var geo = [Geo]?.self
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map){
        street <- map ["street"]
        suite <- map ["suite"]
        zipcode <- map ["zipcode"]
        geo <- map ["geo"]
    }
}

class Company: Mappable{
    
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map){
        name <- map ["name"]
        catchPhrase <- map ["catchPhrase"]
        bs <- map ["bs"]
    }
    
}
class Geo: Mappable{
    
    var fileprivatevar: String?
    var lng: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map){
        fileprivatevar <- map ["fileprivatevar"]
        lng <- map ["lng"]
        
    }
}

