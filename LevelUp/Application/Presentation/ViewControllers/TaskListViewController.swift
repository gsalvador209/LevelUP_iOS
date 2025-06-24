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
    
    private var viewModel: TaskListViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
        bindViewModel()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
    
    private func setupViewModel() {
        viewModel = TaskListViewModel()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            return UITableViewCell()
        }
        let task = viewModel.tasks[indexPath.row]
        cell.configure(with: task)
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Navegación a detalle de tarea
    }
}
