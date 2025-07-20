//
//  AppDelegate.swift
//  RymurizeVideoProAppV2
//
//  Created by herbert l williams on 6/24/25.
//

import Foundation
import Firebase
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
