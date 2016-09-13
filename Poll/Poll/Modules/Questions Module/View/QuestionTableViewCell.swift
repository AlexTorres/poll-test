//
//  QuestionTableViewCell.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/11/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
  static let kReuseIdentifier = "QuestionTableViewCell"
  
  @IBOutlet weak var chekImageView: UIImageView?
  @IBOutlet weak var questionLabel: UILabel!
  var questionItem: QuestionModel? {
    didSet {
      questionLabel.text = questionItem?.question
      chekImageView?.hidden = !questionItem!.isAnswered
    }
    
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    questionLabel.text = ""
    chekImageView?.hidden = true
    
  }
  func showCheck() {
    chekImageView?.hidden = false
  }
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    if selected {
      questionLabel.textColor = UIColor.whiteColor()
    } else {
      questionLabel.textColor = UIColor.questionBlackColor(1.0)
      
    }
    // Configure the view for the selected state
  }
}
