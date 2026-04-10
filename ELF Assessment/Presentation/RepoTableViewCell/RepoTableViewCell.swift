//
//  RepoTableViewCell.swift
//  ELF Assessment
//
//  Created by Shivra on 10/04/26.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with repo: RepoModelElement) {
        nameLabel.text = repo.name ?? ""
        descriptionLabel.text = repo.description ?? ""
    }
}
