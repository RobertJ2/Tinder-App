//
//  MatchTableViewCell.swift
//  Tinder
//
//  Created by Robert Jackson Jr on 6/10/18.
//  Copyright © 2018 Robert Jackson Jr. All rights reserved.
//

import UIKit
import Parse

class MatchTableViewCell: UITableViewCell {

    var recipientObjectId = ""
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var messageTextField: UITextField!
    
    @IBAction func sendTapped(_ sender: Any) {
        
        let message = PFObject(className: "Message")
        
        message["sender"] = PFUser.current()?.objectId
        message["recipient"] = recipientObjectId
        message["content"] = messageTextField.text
        
        message.saveInBackground()
        
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
