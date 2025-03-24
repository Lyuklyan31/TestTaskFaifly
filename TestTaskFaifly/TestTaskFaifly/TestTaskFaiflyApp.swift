//
//  TestTaskFaiflyApp.swift
//  TestTaskFaifly
//
//  Created by Oleh Liuklian  on 22.03.2025.
//

import SwiftUI
import XCoordinator
import HomeFlow

@main
struct TestTaskFaiflyApp: App {
    private let coordinator = HomeCoordinator(initialRoute: .list)

    var body: some Scene {
        WindowGroup {
            CoordinatorView(coordinator: coordinator).ignoresSafeArea()
        }
    }
}

// MARK: - Bridge UIKit (XCoordinator) to SwiftUI

struct CoordinatorView: UIViewControllerRepresentable {
    let coordinator: HomeCoordinator

    func makeUIViewController(context: Context) -> UIViewController {
        coordinator.rootViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // TODO
    }
}
