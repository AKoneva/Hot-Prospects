//
//  Hot_ProspectsApp.swift
//  Hot Prospects
//
//  Created by Анна Перехрест  on 2023/10/05.
//

import SwiftUI

@main
struct Hot_ProspectsApp: App {
    @StateObject var prospects = Prospects()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(prospects)
        }
    }
}
