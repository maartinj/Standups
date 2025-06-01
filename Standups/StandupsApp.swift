//
//  StandupsApp.swift
//  Standups
//
//  Created by Marcin Jędrzejak on 26/05/2025.
//

import ComposableArchitecture
import SwiftUI

@main
struct StandupsApp: App {
    var body: some Scene {
        var editedStandup = Standup.mock
        let _ = editedStandup.title += " Morning Sync"
        WindowGroup {
            var standup = Standup.mock
            let _ = standup.duration = .seconds(6)
            AppView(
                store: Store(initialState: AppFeature.State(
//                    path: StackState([
//                        .detail(
//                            StandupDetailFeature.State(
//                                destination: .editStandup(
//                                    StandupFormFeature.State(
//                                        focus: .attendee(editedStandup.attendees[3].id),
//                                        standup: editedStandup)),
//                                standup: .mock)
//
//                        )
//                    ]),
                    path: StackState([
//                        .detail(StandupDetailFeature.State(standup: .mock)),
//                        .recordMeeting(RecordMeetingFeature.State(standup: standup))
                    ]),
                    standupsList: StandupsListFeature.State(
//                        standups: [standup]
                    )
                )
                ) {
                    AppFeature()
                        ._printChanges()
                }
            )
//            StandupDetailView(
//                store: Store(initialState: StandupDetailFeature.State(standup: .mock)) {
//                    StandupDetailFeature()
//                }
//            )
        }
    }
}
