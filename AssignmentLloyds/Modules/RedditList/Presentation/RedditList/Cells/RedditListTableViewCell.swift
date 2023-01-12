//
//  RedditListTableViewCell.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import UIKit
import SDWebImage

final class RedditListTableViewCell: UITableViewCell, ReusableViewNibLoading {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initializeViews()
    }

    private func initializeViews() {
        bgView.layer.cornerRadius = 8
        bgView.clipsToBounds = true
        self.imgView.layer.borderColor = UIColor.gray.cgColor
        self.imgView.layer.borderWidth = 0.5
    }
    
    func mappedValues(model: RedditListEntityProtocol?) {
        if let dataModel = model {
            self.titleLbl.text = dataModel.authorName
            self.descLbl.text = dataModel.title
            if let imageURL = dataModel.imageUrl {
                self.imgView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeHolderImage"))
            }  else {
                self.imgView.image = UIImage(named: "placeHolderImage")
            }
        }
    }
    
}
