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
    func configureCell(task: Task) {
        todoEventLabel.text = task.nameEvent
        todoDateLabel.text = "Created At: \(DateFormatter.created.string(from: task.createdDateEvent))"
    }
    
}
