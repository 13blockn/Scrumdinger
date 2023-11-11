//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Nate Block on 11/9/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
