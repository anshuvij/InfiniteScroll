//
//  NetworkConstants.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation

class NetworkConstants {
    
    static var shared = NetworkConstants()
    
    private init() {
        
    }
    
    var serverAddress : String {
        get {
            return "https://jsonplaceholder.typicode.com/posts"
        }
    }
}
