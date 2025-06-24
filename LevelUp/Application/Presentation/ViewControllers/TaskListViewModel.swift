//
//  TaskListViewModel.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//


import Foundation
import Combine

class TaskListViewModel {
    @Published private(set) var tasks: [TaskEntity] = []
    private var cancellables = Set<AnyCancellable>()
    //private let getTasksUseCase = GetTasksUseCase()

    init() {
        fetchTasks()
    }

    func fetchTasks() {
//        getTasksUseCase.execute()
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print("Error obteniendo tareas: \(error)")
//                case .finished:
//                    break
//                }
//            }, receiveValue: { [weak self] tasks in
//                self?.tasks = tasks
//            })
//            .store(in: &cancellables)
    }
}
