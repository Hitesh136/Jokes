//
//  JokesListViewController.swift
//  PhonePe
//
//  Created by Hitesh Agarwal on 10/09/22.
//

import UIKit

class JokesListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.dataSource = self
            tableView.register(UINib(nibName: "JokeTableViewCell", bundle: nil), forCellReuseIdentifier: "JokeTableViewCell")
        }
    }
    
    // MARK: - Variables
    var viewModel: JokesListViewModel!
    weak var timer: Timer?
    
    // MARK: - View LifeCycles
    static func getInstance(viewModel: JokesListViewModel) -> JokesListViewController {
        let main = UIStoryboard(name: "Main", bundle: nil)
        let viewController = main.instantiateViewController(withIdentifier: "JokesListViewController") as! JokesListViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJokeData()
        startTimer()
    }
    
    // MARK: - Helper Methods
    func getJokeData() {
        viewModel.getJokes { [weak self] errorMessage in
            guard let self = self else { return }
            if let errorMessage = errorMessage {
                // We can show a alert message here
                print(errorMessage)
                return
            }
            
            self.configureView()
        }
    }
    
    func configureView() {
        self.tableView.reloadData()
    }

    func startTimer() {
        timer?.invalidate()   // just in case you had existing `Timer`, `invalidate` it before we lose our reference to it
        timer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { [weak self] _ in
            self?.getJokeData()
        }
    }

    func stopTimer() {
        timer?.invalidate()
    }

    // if appropriate, make sure to stop your timer in `deinit`

    deinit {
        stopTimer()
    }
}

// MARK: - UITableViewDataSource
extension JokesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeTableViewCell") as! JokeTableViewCell
        cell.configure(cellViewModel: viewModel.cellViewModel(atIndexPath: indexPath), indexPath: indexPath)
        return cell
    }
}
