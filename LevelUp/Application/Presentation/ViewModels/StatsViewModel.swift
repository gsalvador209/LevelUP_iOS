//
//  StatsViewModel.swift
//  LevelUp
//
//  Created by Salvador Chavez on 05/07/25.
//


import Foundation
import CoreData

class StatsViewModel {
    // Cada elemento representa una lista y su array de días
    @Published var statsList: [StatsList] = []

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.container.viewContext) {
        self.context = context
    }

    func loadAllStats() {
        // 1. Traer todas las listas
        let req: NSFetchRequest<ListEntity> = ListEntity.fetchRequest()
        guard let lists = try? context.fetch(req) else { return }

        // 2. Por cada lista, construye los días y completados
        var result: [StatsList] = []

        for list in lists {
            // Trae todas las tareas de la lista
            let tasksReq: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
            tasksReq.predicate = NSPredicate(format: "list == %@", list)
            guard let tasks = try? context.fetch(tasksReq) else { continue }
            print("📋 [StatsVM] fetched tasks count: \(tasks.count)")
            // Arma un diccionario [dateString: cantidad completadas ese día]
            var completions: [String: Int] = [:]
            for task in tasks {
                // Busca TaskCompletionEntity para esta tarea
                let compReq: NSFetchRequest<TaskCompletionEntity> = TaskCompletionEntity.fetchRequest()
                compReq.predicate = NSPredicate(format: "task == %@", task)

                if let completionsForTask = try? context.fetch(compReq) {
                    for comp in completionsForTask {
                        print("🔄 [StatsVM] task \(String(describing: task.id)) -> fetched completions: \(completionsForTask .count)")
                        let dateStr = Self.dateString(from: comp.completedAt ?? Date())
                        completions[dateStr, default: 0] += 1
                    }
                }
            }
            // Construye el array de días para el último año (365 días)
            let today = Date()
            let calendar = Calendar.current
            let totalWeeks = 26
            let daysCount = totalWeeks * 7
            let days: [StatsDay] = (0..<daysCount).map { offset in
                let date = calendar.date(byAdding: .day, value: -offset, to: today)!
                let dateStr = Self.dateString(from: date)
                let count = completions[dateStr] ?? 0
                return StatsDay(date: date, completions: count)
            }.reversed()
            result.append(StatsList(list: list, days: days))
        }

        statsList = result
    }

    private static func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

// Modelos auxiliares
struct StatsList {
    let list: ListEntity
    let days: [StatsDay]
}
struct StatsDay {
    let date: Date
    let completions: Int
}
