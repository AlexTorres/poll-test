//
//  File.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/11/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import UIKit
extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
  // MARK: - Table view data source
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return questionItem?.choices?.count ?? 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(ChoiceTableViewCell.kReuseIdentifier, forIndexPath: indexPath) as! ChoiceTableViewCell
    
    // Configure the cell...
    let choice = questionItem?.choices?[indexPath.row]
    cell.choiceItem = choice
    
    let backgroundView = UIView()
    backgroundView.backgroundColor = UIColor.questionOrangeColor(1.0)
    cell.selectedBackgroundView = backgroundView

    
    return cell
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    selectedIndex = indexPath.row
    sendButton.enabled = true
    
  }
}

