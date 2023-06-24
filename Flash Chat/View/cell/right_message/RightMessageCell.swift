//
//  RightMessageCell.swift
//  Flash Chat
//
//  Created by Administrator on 22/06/2023.
//

import UIKit

class RightMessageCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewMessage.layer.cornerRadius = 16
        viewMessage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var viewMessage: UIView!
    @IBOutlet weak var labelMessage: UILabel!
}
