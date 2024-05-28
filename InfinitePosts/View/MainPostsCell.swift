//
//  MainPostsCell.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import UIKit

class MainPostsCell: UITableViewCell {

    static var identifer : String {
        get {
            return "MainPostsCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "MainPostsCell", bundle: nil)
    }
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.round()
        backView.backgroundColor = .lightGray
    }
    
    func setupCell(viewModel : PostsTableCellViewModel) {
        
        self.nameLabel.text = viewModel.title
    }
}
