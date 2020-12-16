//
//  DopamineApp.swift
//  Dopamine
//
//  Created by David Jagga on 12/13/20.
//

import SwiftUI

@main
struct ToDoLists: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
