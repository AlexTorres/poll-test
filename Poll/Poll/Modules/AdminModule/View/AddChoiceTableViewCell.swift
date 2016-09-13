//
//  AddChoiceTableViewCell.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class AddChoiceTableViewCell: UITableViewCell, UITextFieldDelegate {
  static let kReuseIdentifier = "AddChoiceTableViewCell"
  @IBOutlet weak var addChoiceTextField: UITextField!
  
  @IBOutlet weak var addChoiceButton: UIButton!
  weak var delegate: AddChoiceProtocol?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.addChoiceButton.enabled = false
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.addChoiceButton.enabled = false
    self.addChoiceTextField.text = ""
    
  }
  
  @IBAction func addChoiceButton(sender: AnyObject) {
    sendChoice ()
  }
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    sendChoice ()
    
    return true
  }
  
  func sendChoice () {
    if !addChoiceTextField.text!.isEmpty {
      delegate?.choiceDidAdded(addChoiceTextField.text)
    }
    addChoiceTextField.resignFirstResponder()
  }
}
