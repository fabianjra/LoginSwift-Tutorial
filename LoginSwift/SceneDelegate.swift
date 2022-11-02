//
//  SceneDelegate.swift
//  LoginSwift
//
//  Created by Victor Roldan on 4/05/22.
//

import UIKit
import SwiftKeychainWrapper

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        //Validacion para saber si ya exisita una inicion logueada, para mostrar la pantalla de Login o la de acceso.
        if let windowScene = scene as? UIWindowScene, let _ = KeychainWrapper.standard.string(forKey: "accessToken"){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController{
                let window = UIWindow(windowScene: windowScene)
                
                //Se usa el Navigation, porque la nueva pantalla si posee la navegacion.
                let navigation = UINavigationController(rootViewController: vc)
                window.rootViewController = navigation
                
                window.makeKeyAndVisible()
                
                self.window = window //Se establece la window, como la oantalla de que ya se ingresó.
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

