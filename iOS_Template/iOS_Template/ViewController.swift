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
  
  let questionViewModel = QuestionViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

}

