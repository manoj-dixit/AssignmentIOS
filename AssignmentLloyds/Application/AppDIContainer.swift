//
//  SceneDelegate.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 10/01/23.
//

import UIKit

final class AppDIContainer {
    
    func load(on window: UIWindow?) {
        let module = RedditModule(networkManager: NetworkManager.initObject)
        if let viewController = module.generateViewController() {
            let navigationController = UINavigationController(rootViewController: viewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
}
