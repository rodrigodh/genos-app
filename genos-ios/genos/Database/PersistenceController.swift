import CoreData
import Foundation

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 10 example metrics
        for index in 0 ..< 10 {
            let metric = Metric(context: controller.container.viewContext)

            let calendar = Calendar.current
            let oneDayAgo = calendar.date(byAdding: .day, value: (index + 1) * -1, to: Date())!

            metric.username = "Rodrigodh"
            metric.balance = 20 * Float(index)
            metric.date = oneDayAgo

            if index < 3 {
                metric.exercise = true
            }

            if index == 0 {
                metric.date = Date()
                metric.balance = 20
            }
        }

        return controller
    }()

    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Failed to save changes")
            }
        }
    }

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Main")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
