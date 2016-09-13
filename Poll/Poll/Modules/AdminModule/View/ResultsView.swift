//
//  ResultsView.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit
import SwiftCharts

class ResultsView: UIViewController, SetupViewProtocol {
  static let kStoryboradName = "ResultsView"
  static let kReuseIdentifier = "ResultQuestionTableViewCell"
  
  @IBOutlet weak var chartContainer: UIView!
  var questions: QuestionsModel?
  var chart: BarsChart?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    addChart(questions?.questions![0])
  }
  
  func addChart(questionItem: QuestionModel?) {
    guard questionItem?.allVotes > 0 else {
      return
    }
    chartContainer.subviews.forEach({ $0.removeFromSuperview() })
    
    let chartConfig = BarsChartConfig(
      valsAxisConfig: ChartAxisConfig(from: 0, to: Double(questionItem!.maxVotes) * 1.5, by: questionItem!.parts),
      xAxisLabelSettings: ChartLabelSettings(rotation: 45, rotationKeep: .Top))
    
    let chart = BarsChart(
      frame: CGRectMake(-40, chartContainer.frame.origin.y + 10, chartContainer.frame.width, chartContainer.frame.height),
      chartConfig: chartConfig,
      xTitle: "",
      yTitle: "",
      bars: questionItem!.bars,
      color: UIColor.questionOrangeColor(1.0),
      barWidth: 10,
      horizontal: true
    )
    chartContainer.addSubview(chart.view)
    self.chart = chart
  }
  
  func configureView() {
    configureButtons()
    configureLabels()
  }
  func configureLabels() {
    self.title = NSLocalizedString("ResultsView.titleLabel.text", comment: "")
    
  }
  func configureButtons() {
    
  }
  
}
