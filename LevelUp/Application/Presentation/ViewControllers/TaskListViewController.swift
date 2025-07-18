//
//  TaskListViewController.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//


import UIKit
import Combine


class TaskListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    
    private let viewModel = TaskListViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseIdentifier)
    }
    
    private func bindViewModel() {
        viewModel.$tasks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (task : [TaskEntity]) in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = viewModel.tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseIdentifier, for: indexPath) as! TaskCell
        
        cell.configure(with: task) { taskId in
            self.viewModel.toggleCompletion(taskID: taskId)
        }
        
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Navegación a detalle de tarea
    }
}
