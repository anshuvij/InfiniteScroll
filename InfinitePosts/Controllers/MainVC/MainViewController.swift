//
//  MainViewController.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel : MainViewModel = MainViewModel()
    var cellDataSource : [PostsTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    
    func configView() {
        self.title = "Top Trending Posts"
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                }
                else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            reloadTableView()
        }
    }
    
    func openDetailsVC(movieId : Int) {
        guard let movie = viewModel.retriveSelectedMovie(with: movieId) else {
            return
        }
        let detailsViewModel = DetailsPostViewModel(movie: movie)
        let detailsVC = DetailsPostController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
       
                
    }
}
