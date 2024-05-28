//
//  Observable.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation

class Observable<T> {
    
    var value : T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(value: T? = nil) {
        self.value = value
    }
    
    private var listener : ((T?) -> Void)?
    
    func bind(_ listener : @escaping(T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
