//
//  MovieTableCellViewModel.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation

class PostsTableCellViewModel {
    
    var id : Int
    var title : String
    var body : String
    
    init(movie : TrendingPostsModel) {
        self.id = movie.id
        self.title = movie.title 
        self.body = movie.body 
    }
}
