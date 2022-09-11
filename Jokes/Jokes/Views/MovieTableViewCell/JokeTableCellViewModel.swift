//
//  ContentTableViewCellModel.swift
//  Caraousell
//
//  Created by Hitesh Agarwal on 10/09/22.
//

import Foundation

class JokeTableCellViewModel {
    
    private var dto: JokeDTO
    
    var jokeInString: String
    
    init(dto: JokeDTO) {
        self.dto = dto
        
        self.jokeInString = dto.joke
    } 
}
