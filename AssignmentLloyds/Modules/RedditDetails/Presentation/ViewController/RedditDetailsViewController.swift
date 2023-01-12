//
//  RedditDetailsViewController.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 11/01/23.
//

import UIKit

final class RedditDetailsViewController: UIViewController {

    @IBOutlet private weak var authorImgView: UIImageView!
    @IBOutlet private weak var authorNameLbl: UILabel!
    var viewModel: RedditDetailsViewModelType?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
    }
    
    private func setUpUI() {
        self.authorImgView.layer.borderColor = UIColor.gray.cgColor
        self.authorImgView.layer.borderWidth = 0.5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setData()
    }
    
    private func setData() {
        let details = self.viewModel?.output.getRedditData()
        self.authorNameLbl.text = details?.authorName
        self.authorImgView.sd_setImage(with: URL(string: details?.imagePath ?? ""), placeholderImage: UIImage(named: "placeHolderImage"))
        self.title = details?.title
    }
}
