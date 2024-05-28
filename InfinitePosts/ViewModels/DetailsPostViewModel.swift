//
//  DetailsMovieViewModel.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation

class DetailsPostViewModel {
    
    var movie : TrendingPostsModel
    var movieImage : URL?
    var movieTitle : String
    var movieDescription : String
    var moveId : Int
    
    init(movie: TrendingPostsModel) {
        self.movie = movie
        
        self.moveId = movie.id
        self.movieDescription = movie.body
        self.movieTitle = movie.title
       
    }
}
