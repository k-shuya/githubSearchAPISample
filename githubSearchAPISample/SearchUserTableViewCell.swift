//
//  SearchResultTableViewCell.swift
//  githubSearchAPISample
//
//  Created by 川村周也 on 2022/07/11.
//

import UIKit
import AlamofireImage

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    private var imageURL = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setData(user: GithubSearchUserEntity) {
        imageURL = user.avatarUrl
        userNameLabel.text = user.login
        typeLabel.text = user.type
        
        setImage(imageURL)
        avatarImageView.contentMode = .scaleAspectFill
    }
    
    public func setImage(_ imageRef: String) {
        let URL = URL(string: imageRef)!
        avatarImageView.af.setImage(
            withURL: URL,
            placeholderImage: UIImage(named: "no-image")
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.circle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
