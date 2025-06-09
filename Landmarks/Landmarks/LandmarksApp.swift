//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Vinicius Silva Moreira on 29/05/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
