//
//  JokeListViewModel.swift
//  PhonePe
//
//  Created by Hitesh Agarwal on 10/09/22.
//

import Foundation

class JokesListViewModel {
     
    private var cellViewModels = [JokeTableCellViewModel]()
    
    func getJokes(_ completion: @escaping (String?) -> ()) {
        
        JokeAPIService().getJoke { [weak self] dto in
            guard let self = self else { return }
            
            
            guard let dto = dto else {
                completion("Something Went wrong")
                return
            }
            
            while self.cellViewModels.count >= 10 {
                self.cellViewModels.removeFirst()
            }
            let jokeCellViewModel = JokeTableCellViewModel(dto: dto)
            self.cellViewModels.append(jokeCellViewModel)
            completion(nil)
        }
    }
      
    
    func numberOfRows() -> Int {
        cellViewModels.count
    }
    
    func cellViewModel(atIndexPath indexPath: IndexPath) -> JokeTableCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
}

