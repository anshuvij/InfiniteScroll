//
//  DetailsPostController.swift
//  InfinitePosts
//
//  Created by Anshu Vij on 28/05/24.
//

import UIKit

class DetailsPostController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel : DetailsPostViewModel
    
    init(viewModel : DetailsPostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsPostController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configView()
    }
    
    func configView() {
        
        self.title = "Post Details"
        self.titleLabel.text = viewModel.movieTitle
        self.descriptionLabel.text = viewModel.movieDescription
    }
    
}
