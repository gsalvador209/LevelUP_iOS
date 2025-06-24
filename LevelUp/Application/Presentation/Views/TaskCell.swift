//
//  TaskCell.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//


import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!

    func configure(with task: TaskEntity) {
        titleLabel.text = task.title
    }
}
