//
//  JTSpeech.swift
//  JTFramework
//
//  Created by JT on 2018/6/19.
//  Copyright © 2018年 JT. All rights reserved.
//

import Speech

@available(iOS 10.0, *)
public class JTSpeech: NSObject {
    public weak var delegate: JTSpeechDelegate?
    private let speechRecognizer: SFSpeechRecognizer
    private let audioEngine = AVAudioEngine()
    private var audioBufferRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    public init(locale: Locale) throws {
        let speech = SFSpeechRecognizer(locale: locale)
        if speech == nil {
            throw JTSpeechError.localeNotSupported
        }
        speechRecognizer = speech!
        super.init()
        do {
            try setupAuthorize()
            try setupAudioSession()
        } catch let e{
            throw e
        }
        speechRecognizer.delegate = self
    }
}
@available(iOS 10.0, *)
extension JTSpeech {
    public func start(handler: @escaping (String, Error?) -> Void) throws {
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        audioBufferRecognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let request = audioBufferRecognitionRequest else { throw JTSpeechError.unableToCreateSFSpeechAudioBufferRecognitionRequest }
        request.shouldReportPartialResults = true
        recognitionTask = speechRecognizer.recognitionTask(with: request) {
            [weak self]
            speechRecognitionResult, error in
            var isFinal = false
            if let result = speechRecognitionResult {
                isFinal = result.isFinal
                let text = result.bestTranscription.formattedString
                handler(text, error)
            }
            if isFinal {
                self?.stop()
            }
        }
        let outputFormat = audioEngine.inputNode.outputFormat(forBus: 0)
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: outputFormat) {
            avAudioPCMBuffer, _ in
            request.append(avAudioPCMBuffer)
        }
        audioEngine.prepare()
        do { try audioEngine.start() }
        catch { throw JTSpeechError.audioEngineCouldNotStart }
    }
    public func stop() {
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        if audioBufferRecognitionRequest != nil {
            audioBufferRecognitionRequest?.endAudio()
            audioBufferRecognitionRequest = nil
        }
        if let task = recognitionTask, (!task.isCancelled || !task.isFinishing) {
            task.finish()
        }
        recognitionTask = nil
    }
}
@available(iOS 10.0, *)
extension JTSpeech {
    private func setupAuthorize() throws {
        switch SFSpeechRecognizer.authorizationStatus() {
        case .notDetermined:
            throw JTSpeechError.notDetermined
        case .denied:
            throw JTSpeechError.denied
        case .restricted:
            throw JTSpeechError.restricted
        case .authorized:
            break;
        @unknown default:
            fatalError()
        }
    }
    private func setupAudioSession() throws {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.record, mode: AVAudioSession.Mode.measurement, options: .duckOthers)
            try audioSession.setActive(true, options: AVAudioSession.SetActiveOptions.notifyOthersOnDeactivation)
        } catch {
            throw JTSpeechError.audioSessionError
        }
    }
}
@available(iOS 10.0, *)
extension JTSpeech: SFSpeechRecognizerDelegate {
    public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        delegate?.availabilityDidChange(speechRecognizer, availabilityDidChange: available)
    }
}
public enum JTSpeechError: Error {
    case notDetermined
    case denied
    case restricted
    case localeNotSupported
    case audioSessionError
    case unableToCreateSFSpeechAudioBufferRecognitionRequest
    case audioEngineCouldNotStart
}
@available(iOS 10.0, *)
public protocol JTSpeechDelegate: NSObjectProtocol {
    func availabilityDidChange(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool)
}
@available(iOS 10.0, *)
extension JTSpeechDelegate {
    func availabilityDidChange(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {}
}
