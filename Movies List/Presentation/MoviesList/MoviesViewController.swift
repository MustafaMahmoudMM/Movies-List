//
//  ViewController.swift
//  Movies List
//
//  Created by Mustafa Mahmoud on 12/22/18.
//  Copyright © 2018 Mustafa Mahmoud. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var remoteMoviesList = [Result]()
    var localMoviesList = [Result]()
    var sectionHeader = ["My Movies", "All Movies"]
    var currentPage = 1
    var totalPages  = 1
    var presenter: MoviesListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MovieCell")
        moviesTableView.estimatedRowHeight = 200
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        self.presenter = MoviesListPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        remoteMoviesList = [Result]()
        localMoviesList = [Result]()
        presenter.getLocalMovies()
        presenter.getRemoteMovies(with: String(self.currentPage))
    }
}

extension MoviesViewController: MoviesListViewProtocol {
    func updateRemoteMovies(with movieListModel: MoviesListModel) {
        if let movies = movieListModel.results {
            remoteMoviesList.append(contentsOf: movies)
            moviesTableView.reloadData()
        }
        
        if let totalPages = movieListModel.totalPages {
            self.totalPages = totalPages
        }
        
    }
    
    func updateLocalMovies(with movies: [Result]) {
        localMoviesList.append(contentsOf: movies)
        moviesTableView.reloadData()
    }
    
    func showProgressBar() {
        loadingView.isHidden = false
        indicator.startAnimating()
    }
    
    func hideProgressBar() {
        loadingView.isHidden = true
        indicator.stopAnimating()
    }
    
    
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if localMoviesList.count > 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.numberOfSections == 2 {
            return self.sectionHeader[section]
        } else {
            return self.sectionHeader[1]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.numberOfSections == 2 && section == 0{
            return localMoviesList.count
        } else {
            return remoteMoviesList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieTableViewCell
        if tableView.numberOfSections == 2 && indexPath.section == 0{
            cell.configureLocal(with: localMoviesList[indexPath.row])
        } else {
            cell.configure(with: remoteMoviesList[indexPath.row])
            if indexPath.row == remoteMoviesList.count - 1 && self.currentPage + 1 <= self.totalPages {
                presenter.getRemoteMovies(with: String(currentPage + 1))
            }
        }
        
        return cell
    }
}
