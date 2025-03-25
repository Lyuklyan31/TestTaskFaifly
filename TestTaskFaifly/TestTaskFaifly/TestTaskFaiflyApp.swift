//
//  TestTaskFaiflyApp.swift
//  TestTaskFaifly
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import SwiftUI
import XCoordinator
import HomeFlow
import RealmSwift

@main
struct TestTaskFaiflyApp: SwiftUI.App {
    private let coordinator = HomeCoordinator(initialRoute: .list)

    
    init() {
            Realm.Configuration.defaultConfiguration = Realm.Configuration(
                schemaVersion: 1,
                migrationBlock: { migration, oldSchemaVersion in
                    if oldSchemaVersion < 1 {
                        migration.enumerateObjects(ofType: PersonRealm.className()) { oldObject, newObject in
                            newObject!["ownerId"] = 0
                        }
                    }
                }
            )
        }
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordinator: coordinator)
                .environment(\.realmConfiguration, Realm.Configuration.defaultConfiguration)
                .ignoresSafeArea()
        }
    }
}

// MARK: - Bridge UIKit (XCoordinator) to SwiftUI

struct CoordinatorView: UIViewControllerRepresentable {
    let coordinator: HomeCoordinator

    func makeUIViewController(context: Context) -> UIViewController {
        coordinator.rootViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}
