//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Nate Block on 11/9/23.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()

    private var player: AVPlayer { AVPlayer.sharedDingPlayer }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0).fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }.padding()
            .foregroundColor(scrum.theme.accentColor)
            .onAppear {
                scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
                scrumTimer.startScrum()
                scrumTimer.speakerChangedAction = {
                    player.seek(to: .zero)
                    player.play()
                }
            }
            .onDisappear {
                scrumTimer.stopScrum()
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
