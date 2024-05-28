//
//  MainViewModel.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation

class MainViewModel {
    
    var isLoading : Observable<Bool> = Observable(value: false)
    var cellDataSource : Observable<[PostsTableCellViewModel]> = Observable(value: nil)
    var dataSource: [TrendingPostsModel] = []
    var currentPage = 1
    private let limit = 10
    
    func numberOfSections() -> Int
    {
        return 1
    }
    
    func numberOfRows(in section : Int) -> Int {
        return self.dataSource.count
    }
    
    func getData() {
        
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies(startingAt: currentPage, limit: limit) { [weak self] result in
            
            self?.isLoading.value = false
            switch result {
            case .success(let data) :
                
                if data.1 == false {
                    self?.dataSource.append(contentsOf: data.0)
                }
                print("top trending count \(self?.dataSource.count)")
                self?.mapCellData()
            case .failure(let error) :
                print(error)
                
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource.compactMap({PostsTableCellViewModel(movie: $0)})
    }
    
    func retriveSelectedMovie(with id : Int) -> TrendingPostsModel? {
        
        guard let movie = dataSource.first(where: { $0.id == id }) else {
            return nil
        }
        
        return movie
    }
    
}
