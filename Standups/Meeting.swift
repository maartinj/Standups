//
//  Meeting.swift
//  Standups
//
//  Created by Marcin Jędrzejak on 01/06/2025.
//

import SwiftUI

struct MeetingView: View {
    let meeting: Meeting
    let standup: Standup

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                ForEach(self.standup.attendees) { attendee in
                    Text(attendee.name)
                }
                Text("Transcript")
                    .font(.headline)
                    .padding(.top)
                Text(self.meeting.transcript)
            }
        }
        .navigationTitle(Text(self.meeting.date, style: .date))
        .padding()
    }
}
