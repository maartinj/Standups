//
//  SpeechClient.swift
//  Standups
//
//  Created by Marcin Jędrzejak on 30/05/2025.
//

import Speech

struct SpeechClient {
    var requestAuthorization: @Sendable () async -> SFSpeechRecognizerAuthorizationStatus
}

import Dependencies

extension SpeechClient: DependencyKey {
    static var liveValue: SpeechClient = Self(
        requestAuthorization: {
            await withUnsafeContinuation { continuation in
                SFSpeechRecognizer.requestAuthorization { status in
                    continuation.resume(with: .success(status))
                }
            }
        }
    )

    static var previewValue = SpeechClient(
        requestAuthorization: { .authorized }
    )
}

extension DependencyValues {
    var speechClient: SpeechClient {
        get { self[SpeechClient.self] }
        set { self[SpeechClient.self] = newValue }
    }
}
