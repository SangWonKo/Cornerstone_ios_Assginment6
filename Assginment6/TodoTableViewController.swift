//
//  ViewController.swift
//  Assginment6
//
//  Created by 고상원 on 2019-05-02.
//  Copyright © 2019 고상원. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var sections: [String] = ["Important","Kinda","Trash"]
    var todos:[String] = [String]()
    var todos1:[String] = [String]()
    var todos2:[String] = [String]()
    
    
    // MARK: - Constants
    
    private let cellId = "todoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: cellId)
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
        
        tableView.allowsMultipleSelectionDuringEditing = true
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    @objc func addTodo() {
        
        let addTodoVC = addTodoViewController()
        addTodoVC.delegate = self
        navigationController?.pushViewController(addTodoVC, animated: true)
        
    }
    
    
    //MARK: - tableview data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int = 0
        if section == 0 {
            count = todos.count
        }
        else if section == 1 {
            count = todos1.count
        }
        else if section == 2 {
            count = todos2.count
        }
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // for each cell what to do
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoTableViewCell
        if indexPath.section == 0 {
            cell.todoName.text = todos[indexPath.row]
        }
        else if indexPath.section == 1 {
            cell.todoName.text = todos1[indexPath.row]
        }
        else if indexPath.section == 2 {
            cell.todoName.text = todos2[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .green
    }

}

extension TodoTableViewController {
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .insert:
            break
        case .delete:
            if indexPath.section == 0 {
                todos.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            else if indexPath.section == 1 {
                todos1.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            else if indexPath.section == 2 {
                todos2.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath.section == 0 {
            let movedTodos = todos[sourceIndexPath.row]
            todos.remove(at: sourceIndexPath.row)
            todos.insert(movedTodos, at: destinationIndexPath.row)
        }
        else if sourceIndexPath.section == 1 {
            let movedTodos = todos1[sourceIndexPath.row]
            todos1.remove(at: sourceIndexPath.row)
            todos1.insert(movedTodos, at: destinationIndexPath.row)
        }
        else if sourceIndexPath.section == 2 {
            let movedTodos = todos2[sourceIndexPath.row]
            todos2.remove(at: sourceIndexPath.row)
            todos2.insert(movedTodos, at: destinationIndexPath.row)
        }
        
            
        
        
    }
}

extension TodoTableViewController: AddTodoViewControllerDelegate {
    
    
    func addTodoDidCancel() {
        
    }
    
    func addTodoDidFinish1(_ todo: String) {
        todos.append(todo)
        tableView.reloadData()  // refresh
    }
    
    func addTodoDidFinish2(_ todo: String) {
        todos1.append(todo)
        tableView.reloadData()  // refresh
    }
    
    func addTodoDidFinish3(_ todo: String) {
        todos2.append(todo)
        tableView.reloadData()  // refresh
    }
    
    

}

