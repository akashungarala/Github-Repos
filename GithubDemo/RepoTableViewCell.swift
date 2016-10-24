//
//  RepoTableViewCell.swift
//  GithubDemo
//
//  Created by Akash Ungarala on 10/22/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoStars: UILabel!
    @IBOutlet weak var repoForks: UILabel!
    @IBOutlet weak var repoHandle: UILabel!
    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    
    var repo: GithubRepo! {
        
        didSet {
            repoName.text = repo.name
            repoStars.text = "\(repo.stars!)"
            repoForks.text = "\(repo.forks!)"
            repoHandle.text = repo.ownerHandle
            let imageUrl = NSURL(string: repo.ownerAvatarURL!)
            repoImage.setImageWith(imageUrl! as URL)
            repoDescription.text = repo.repoDescription
            repoLanguage.text = repo.repoLanguage
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        repoName.preferredMaxLayoutWidth = repoName.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        repoName.preferredMaxLayoutWidth = repoName.frame.size.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
