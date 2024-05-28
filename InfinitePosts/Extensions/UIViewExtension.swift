//
//  UIViewExtension.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import Foundation
import UIKit

extension UIView {
    
    func round(_ radius : CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color : UIColor, width : CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
