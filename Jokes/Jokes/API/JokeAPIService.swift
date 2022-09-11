//
//  JokeAPIService.swift
//  PhonePe
//
//  Created by Hitesh Agarwal on 10/09/22.
//

import Foundation
class JokeAPIService {
    var apiService = APIService()
    
    func getJoke(_ completion: @escaping ((JokeDTO?) -> ()) ) {
        let urlInString = APIPath().getJokeListPath()
        apiService.getAPIRequest(urlInString) { data in
            
            guard let data = data,
                  var msg = String(data: data, encoding: .utf8) else {
                completion(nil)
                return
            }

            msg = msg.replacingOccurrences(of: "\"", with: "")
            let jokeDTO = JokeDTO(joke: msg)
            
            completion(jokeDTO)
        }
        
    }
    
}
