//
//  genosApp.swift
//  genos
//
//  Created by Rodrigo Schieck on 19/08/23.
//

import SwiftUI

@main
struct GenosApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared

    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.surfaceColor)
    }

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
