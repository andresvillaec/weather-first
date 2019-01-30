//
//  ViewController.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/18/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {

  @IBOutlet weak var questionsTableView: UITableView!
  
  var questionViewModel = QuestionViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    bindViewModel()
    questionViewModel.getQuestionsFromApi()
  }
  
  func setupTableView() {
    questionsTableView.reactive.dataSource.forwardTo = self
  }
  
  func bindViewModel() {
    questionViewModel.questions.bind(to: questionsTableView, cellType: UITableViewCell.self) { (cell, question) in
      cell.textLabel?.text = question.title
      cell.reactive.bag.dispose()
    }
  }
}

