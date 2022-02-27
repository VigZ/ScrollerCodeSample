//
//  ScrollerCodeSampleApp.swift
//  Shared
//
//  Created by Kyle Vigorito on 2/27/22.
//

import SwiftUI

@main
struct ScrollerCodeSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
