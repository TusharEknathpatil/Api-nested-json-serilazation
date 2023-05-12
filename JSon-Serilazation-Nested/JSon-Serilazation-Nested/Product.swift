//
//  Product.swift
//  JSon-Serilazation-Nested
//
//  Created by Mac on 11/05/23.
//

import Foundation

struct Product {
    var id: Int
    var title:String
    var description:String
    var category:String
    var image:String
    var rating:Rating
}

struct Rating{
    var rate:Double
    var count:Int
}
