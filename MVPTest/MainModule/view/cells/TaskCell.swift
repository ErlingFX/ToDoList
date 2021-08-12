//
//  TaskCell.swift
//  MVPTest
//
//  Created by Alexander Nazarov on 05.08.2021.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var todoEventLabel: UILabel!
    @IBOutlet weak var todoDateLabel: UILabel!
    
    
    func configureCell(_ task: Task) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        let dateTimeString = formatter.string(from: currentDateTime)
        todoEventLabel.text = task.nameEvent
        todoDateLabel.text = "от: " + dateTimeString
    }
}
