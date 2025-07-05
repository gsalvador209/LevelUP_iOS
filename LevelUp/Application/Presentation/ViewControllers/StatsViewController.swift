//
//  StatsViewController.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//


import UIKit
import Combine

class StatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private let viewModel = StatsViewModel()
    private var statsList: [StatsList] = []
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Estadísticas"
        view.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StatsListCell.self, forCellReuseIdentifier: "StatsListCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        // Suscribe a los cambios
        viewModel.$statsList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] stats in
                self?.statsList = stats
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)

        viewModel.loadAllStats()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        statsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatsListCell", for: indexPath) as! StatsListCell
        let stats = statsList[indexPath.row]
        cell.configure(with: stats)
        return cell
    }
}
