//
//  File.swift
//  pokemonApp
//
//  Created by Adarsh Chaurasia on 18/05/24.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id :Int
    let name : String
    let imageUrl : String
    let type : String
    let weight : Int
    let height:Int
    let attack: Int
    let defense : Int
    let description : String
}
