//
//  ToDoDetailTableTableViewController.swift
//  ToDo List
//
//  Created by Brandon Boey on 2/9/20.
//  Copyright © 2020 Brandon Boey. All rights reserved.
//

import UIKit

class ToDoDetailTableTableViewController: UITableViewController {
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var noteView: UITextView!
    
    var toDoItem: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = toDoItem
        if toDoItem == nil {
            toDoItem = ""
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        toDoItem = nameField.text
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
            
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
