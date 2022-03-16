//
//  SceneDelegate.swift
//  BaiSi
//
//  Created by jie.huang on 2022/3/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let _ = (scene as? UIWindowScene) else { return }
        
        UINavigationBar.appearance().tintColor = UIColor.red
        UITabBar.appearance().tintColor = UIColor.red
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = MainViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

