//
//  SceneDelegate.swift
//  KeywordNews
//
//  Created by 이현영 on 2022/01/29.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.tintColor = .systemOrange
//       상단바 아이콘들 오렌지로 컬러 통일한 것
        window?.rootViewController = UINavigationController(rootViewController: NewListViewController())
        window?.makeKeyAndVisible()
    }


}

