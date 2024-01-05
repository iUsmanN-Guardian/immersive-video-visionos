//
//  immersive_video_vOSApp.swift
//  immersive-video-vOS
//
//  Created by Usman Nazir on 05/01/2024.
//

import SwiftUI

@main
struct immersive_video_vOSApp: App {
    @State private var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(viewModel: viewModel)
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
