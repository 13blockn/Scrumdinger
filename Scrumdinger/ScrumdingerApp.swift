//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Nate Block on 11/9/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
