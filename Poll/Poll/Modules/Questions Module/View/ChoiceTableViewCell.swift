//
//  ChoiceTableViewCell.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/11/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class ChoiceTableViewCell: UITableViewCell {
  static let kReuseIdentifier = "ChoiceTableViewCell"
  @IBOutlet weak var choiceLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  var choiceItem: ChoiceModel? {
    didSet {
      choiceLabel.text = choiceItem?.choice
      
    }
    
  }
  
}
