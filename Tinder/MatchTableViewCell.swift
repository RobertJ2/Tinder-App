//
//  MatchTableViewCell.swift
//  Tinder
//
//  Created by Robert Jackson Jr on 6/10/18.
//  Copyright © 2018 Robert Jackson Jr. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var messageTextField: UITextField!
    
    @IBAction func sendTapped(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
