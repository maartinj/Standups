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
            AppView(
                store: Store(initialState: AppFeature.State(
                    path: StackState([
                        .detail(
                            StandupDetailFeature.State(
                                destination: .editStandup(
                                    StandupFormFeature.State(
                                        focus: .attendee(editedStandup.attendees[3].id),
                                        standup: editedStandup)),
                                standup: .mock)

                        )
                    ]),
                    standupsList: StandupsListFeature.State(standups: [.mock])
                )
                ) {
                    AppFeature()
                        ._printChanges()
                }
            )
            StandupDetailView(
                store: Store(initialState: StandupDetailFeature.State(standup: .mock)) {
                    StandupDetailFeature()
                }
            )
        }
    }
}
