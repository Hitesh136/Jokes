//
//  ContentTableViewCell.swift
//  Caraousell
//
//  Created by Hitesh Agarwal on 10/09/22.
//

import UIKit
 
class JokeTableViewCell: UITableViewCell {
 
    // MARK: - IBOutlets
    @IBOutlet weak var jokeLabel: UILabel!
    
    // MARK: - Variables
    var viewModel: JokeTableCellViewModel!
    var cellIndexPath: IndexPath!
    
    
    // MARK: - ViewLifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Confiugrations
    func configure(cellViewModel: JokeTableCellViewModel,
                   indexPath: IndexPath) {
        self.viewModel = cellViewModel
        self.cellIndexPath = indexPath
        jokeLabel.text = viewModel.jokeInString
    }
      
}
