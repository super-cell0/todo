//
//  AddTodoTableViewController.swift
//  Todos
//
//  Created by 贝蒂小熊 on 2022/3/6.
//

import UIKit

//反向传值定义个delegate
protocol AddTodoTableViewControllerDelegate {
    func didAdd(name: String)
}

class AddTodoTableViewController: UITableViewController {

    var delegate: AddTodoTableViewControllerDelegate?
    @IBOutlet weak var todoTextView: UITextView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoTextView.delegate = self

    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        if !todoTextView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            delegate?.didAdd(name: todoTextView.text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//textView自动换行刷新
extension AddTodoTableViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
//        tableView.beginUpdates()
//        tableView.endUpdates()
        tableView.performBatchUpdates {
            
        }
        
    }
}
