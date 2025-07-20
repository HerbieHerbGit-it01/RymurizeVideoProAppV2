//
//  RymurizeVideoProAppV2App.swift
//  RymurizeVideoProAppV2
//
//  Created by herbert l williams on 6/22/25.
//

import SwiftUI
import Firebase


@main
struct RymurizeVideoProApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            VideoListView() // <- NOW this will show up when you run on your iPhone
        }
    }
}
