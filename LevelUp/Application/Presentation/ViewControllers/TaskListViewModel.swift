//
//  TaskListViewModel.swift
//  LevelUp
//
//  Created by Salvador Chavez on 23/06/25.
//


import Foundation
import CoreData
import Combine

//Para notificar a la UI de una nueva tarea
extension Notification.Name {
    static let taskAdded = Notification.Name("taskAdded")
}


class TaskListViewModel {
    
    //Array de tareas expuesto
    @Published private(set) var tasks: [TaskEntity] = []
    
    //Inyección del repositorio
    private let taskRepo = TaskRepository()
    private var cancellables = Set <AnyCancellable>()
        
    init() {
        NotificationCenter.default.publisher(for: .taskAdded)
            .sink { [weak self] _ in self?.fetchTasks()}
            .store(in: &cancellables)
        
        fetchTasks()
    }

    //Fetch asíncrono para no bloquear la UI
    func fetchTasks() {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let all = try self.taskRepo.fetchAllTasks()
                DispatchQueue.main.async {
                    self.tasks = all
                }
            } catch {
                print("Error fetching tasks:", error)
            }
        }
    }
    
    func addTask(
        title : String,
        description : String?,
        list: ListEntity,
        deadline: Date?
    ){
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try self.taskRepo.addTask(title: title, description: description, list: list, startDate: nil, deadline: deadline, reminders: nil)
                NotificationCenter.default.post(name: .taskAdded, object: nil)
            } catch {
                print("Error adding task:", error)
            }
            
        }
    }
    
    func toggleCompletion(taskID: UUID) {
        DispatchQueue.global(qos: .userInitiated).async {
            do{
                if let task = try self.taskRepo.fetchTask(by: taskID) {
                    try self.taskRepo.setCompleted(!task.isCompleted, for: task)
                    NotificationCenter.default.post(name: .taskAdded, object: nil)
                }
            }catch {
                print("Error toggling completion", error)
            }
        }
    }
    
    
}
