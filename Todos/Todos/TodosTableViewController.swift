//
//  TodosTableViewController.swift
//  Todos
//
//  Created by 贝蒂小熊 on 2022/3/6.
//

import UIKit

//persent/ dismiss
//push/ pop

class TodosTableViewController: UITableViewController {

    var todos: [Todo] = [
        Todo(name: "chen", checked: false),
        Todo(name: "hello", checked: false),
        Todo(name: "h1234", checked: false),
        Todo(name: "chencan", checked: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kreuseIdentifierID, for: indexPath) as! TodoTableViewCell
        

        cell.checkBoxButton.isSelected = todos[indexPath.row].checked
        cell.todoLabel.text = todos[indexPath.row].name
        cell.todoLabel.textColor = todos[indexPath.row].checked ? .tertiaryLabel : .label
        
        //选中按钮过后做的事
        cell.checkBoxButton.addAction(UIAction(handler: { action in
            //self.todos[indexPath.row].checked = !self.todos[indexPath.row].checked
            self.todos[indexPath.row].checked.toggle()
            cell.checkBoxButton.isSelected = self.todos[indexPath.row].checked
            cell.todoLabel.textColor = self.todos[indexPath.row].checked ? .tertiaryLabel : .label
        }), for: .touchUpInside)
        
        return cell
    }

    // MARK: Navigation 反向传值从AddTodoTableViewController传到TodoTableViewController的 name
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kAddTodoID {
            let vc=segue.destination as! AddTodoTableViewController
            vc.delegate = self
        }
    }
    

}

extension TodosTableViewController:AddTodoTableViewControllerDelegate {
    func didAdd(name: String) {
        todos.append(Todo(name: name, checked: false))
        
        tableView.insertRows(at: [IndexPath(row: todos.count - 1, section: 0)], with: .automatic)
        //print(name)
    }
}
