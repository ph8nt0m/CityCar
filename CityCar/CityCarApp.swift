//
//  CityCarApp.swift
//  CityCar
//
//  Created by 이동준 on 2022/04/13.
//

import SwiftUI

@main
struct CityCarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
