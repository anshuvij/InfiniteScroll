//
//  MainViewController+TableView.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation
import UIKit

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        
        registerCells()
    }
    
    func registerCells() {
        
        self.tableView.register(MainPostsCell.register(), forCellReuseIdentifier:MainPostsCell.identifer)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.tableFooterView = nil
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainPostsCell.identifer, for: indexPath) as? MainPostsCell
        else {
            return UITableViewCell()
        }
        let movieData = cellDataSource[indexPath.row]
        cell.setupCell(viewModel: movieData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        self.openDetailsVC(movieId: movieId)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == cellDataSource.count - 1 { // last cell
            self.tableView.tableFooterView = createSpinnerView()
            viewModel.currentPage += 1
            viewModel.getData()// load more posts
            }
        }
    
    func createSpinnerView() -> UIView {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    
    
}
