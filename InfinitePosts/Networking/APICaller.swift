//
//  APICaller.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation

enum NetworkError : Error {
    case urlError
    case canNotParseData
}

class APICaller {
    
    private static var cachedPosts: [Int: TrendingPost] = [:]
    
    static func getTrendingMovies( startingAt start: Int, limit: Int, completionHandler : @escaping (_ result : Result<(TrendingPost,Bool),NetworkError>) -> Void) {
        
        if let cachedData = cachedPosts[start] {
            completionHandler(.success((cachedData,true)))
                return
        }
        
        let urlString = NetworkConstants.shared.serverAddress
        guard let url = URL(string: "\(urlString)?_page=\(start)&_limit=\(limit)") else {
            completionHandler(.failure(NetworkError.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            
            if let data = dataResponse {
                do {
                    let decodedResponse = try JSONDecoder().decode(TrendingPost.self, from: data)
                    self.cachedPosts[start] = decodedResponse
                    completionHandler(.success((decodedResponse,false)))
                }
                catch DecodingError.keyNotFound(let key, let context) {
                    print("could not find key \(key) in JSON: \(context.debugDescription)")
                    completionHandler(.failure(NetworkError.canNotParseData))
                } catch DecodingError.valueNotFound(let type, let context) {
                   print("could not find type \(type) in JSON: \(context.debugDescription)")
                    completionHandler(.failure(NetworkError.canNotParseData))
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                    completionHandler(.failure(NetworkError.canNotParseData))
                } catch DecodingError.dataCorrupted(let context) {
                  print("data found to be corrupted in JSON: \(context.debugDescription)")
                    completionHandler(.failure(NetworkError.canNotParseData))
                } catch let error as NSError {
                    completionHandler(.failure(NetworkError.canNotParseData))
                    print("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                }
            }
            
        }.resume()
        
        
    }
}
