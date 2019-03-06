//
//  ViewController.swift
//  iOS_Template
//
//  Created by Sebastian Guerrero F on 1/18/19.
//  Copyright © 2019 DEVSU. All rights reserved.
//

import UIKit
import RxDataSources
import RxCocoa
import RxSwift

class ViewController: UIViewController {

  @IBOutlet weak var questionsTableView: UITableView!
  
  var questionViewModel = QuestionViewModel()
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
    questionViewModel.getQuestionsFromApi()
  }
  
  func bindViewModel() {
    questionViewModel.questions.asObservable().bind(to: questionsTableView.rx.items) { tableView, indexPath, question in
      let cell = UITableViewCell()
      cell.textLabel?.text = question.title
      cell.selectionStyle = .none
      return cell
    }
    .disposed(by: disposeBag)
    
    questionsTableView.rx.modelSelected(Question.self).bind(to: questionViewModel.selectedQuestion).disposed(by: disposeBag)
    
    questionViewModel.selectedQuestion.asObservable().skip(1).subscribe { (_) in
      self.performSegue(withIdentifier: "showQuestion", sender: self)
    }.disposed(by: disposeBag)
  }
}

