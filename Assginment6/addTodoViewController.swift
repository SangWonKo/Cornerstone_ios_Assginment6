//
//  addTodoViewController.swift
//  Assginment6
//
//  Created by 고상원 on 2019-05-02.
//  Copyright © 2019 고상원. All rights reserved.
//

import UIKit

protocol AddTodoViewControllerDelegate: class {
    func addTodoDidCancel()
    func addTodoDidFinish1(_ todo: String)
    func addTodoDidFinish2(_ todo: String)
    func addTodoDidFinish3(_ todo: String)
    
}

class addTodoViewController: UIViewController {
    
    weak var delegate: AddTodoViewControllerDelegate?
    //Label
    let descriptionLabel: UILabel = UILabel(title: "Add Todo", color: .black, fontSize: 20, bold: true)
       
    
    //Textfield
    let todoTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter here..."
        
        return tf
    }()
    
    let segmentedControl: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Important","Kinda","Trash"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        
        seg.selectedSegmentIndex = 0
        //seg.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        seg.tintColor = .green
        seg.backgroundColor = .white
        return seg
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
         setupUI()
        navigationItem.title = "Add Todo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didAddTodo))
        
    }
    
//    @objc fileprivate func indexChanged(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 0:
//            break
//        case 1:
//            break
//        case 2:
//            break
//        default:
//            break
//        }
//
//    }
    
    @objc fileprivate func didAddTodo() {
        // delegate! -> callback
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if let todo = todoTextField.text {
                delegate?.addTodoDidFinish1(todo)
                navigationController?.popViewController(animated: true)
            }
        case 1:
            if let todo = todoTextField.text {
                delegate?.addTodoDidFinish2(todo)
                navigationController?.popViewController(animated: true)
            }
        case 2:
            if let todo = todoTextField.text {
                delegate?.addTodoDidFinish3(todo)
                navigationController?.popViewController(animated: true)
            }
        default:
            break
        }
    
    }
    
    
    fileprivate func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [descriptionLabel, todoTextField, segmentedControl])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        view.addSubview(stackView)
        //constraints
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        
    }
    
//    fileprivate func setupButton() {
//        let segmentedControl = UISegmentedControl(items: ["Important","Kinda","Trash"])
//        segmentedControl.selectedSegmentIndex = 0
//        segmentedControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
//        segmentedControl.tintColor = .green
//        segmentedControl.backgroundColor = .white
//        view.addSubview(segmentedControl)
//
//    }
    

   

}
