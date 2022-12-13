//
//  SceneDelegate.swift
//  ParkerPlaysv2
//
//  Created by Suzie  on 12/12/22.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard
      let windowScene = (scene as? UIWindowScene)
    else {
      return
    }
    // One
    self.window = UIWindow(windowScene: windowScene)
    // Two
    self.window?.rootViewController = ViewController()
    // Three
    self.window?.makeKeyAndVisible()
  }
}
