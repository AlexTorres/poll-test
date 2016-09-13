//
//  ResultView+UITableView.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import UIKit
extension ResultsView: UITableViewDelegate, UITableViewDataSource {
  // MARK: - Table view data source
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return questions?.questions?.count ?? 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(ResultsView.kReuseIdentifier, forIndexPath: indexPath) as! QuestionTableViewCell
    
    // Configure the cell...
    let question = questions?.questions?[indexPath.row]
    cell.questionItem = question
    
    let backgroundView = UIView()
    backgroundView.backgroundColor = UIColor.questionOrangeColor(1.0)
    cell.selectedBackgroundView = backgroundView
    
    return cell
  }
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    addChart(questions?.questions?[indexPath.row])
    // presenter?.loadQuestionView(questions?.questions?[indexPath.row])
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    
  }
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
}
