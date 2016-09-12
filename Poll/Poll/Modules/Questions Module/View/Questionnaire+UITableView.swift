//
//  Questionaty+UITableView.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/11/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import UIKit
extension QuestionnaireView: UITableViewDelegate, UITableViewDataSource {
  // MARK: - Table view data source
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return questions?.count ?? 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(QuestionTableViewCell.kReuseIdentifier, forIndexPath: indexPath) as! QuestionTableViewCell
    
    // Configure the cell...
    let question = questions?[indexPath.row]
    cell.questionItem = question
    
    let backgroundView = UIView()
    backgroundView.backgroundColor = UIColor.questionOrangeColor(1.0)
    cell.selectedBackgroundView = backgroundView
    
    return cell
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    selectedQuestion = indexPath.row
    if !questions![indexPath.row].isAnswered {
      presenter?.loadQuestionView(questions?[indexPath.row])
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
  }
}
