import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var audioPlayer: AVAudioPlayer?
    private(set) var isPlaying: Bool = false // Tracks if a sound is currently playing

    private init() {}

    func playSound(named sound: String, loop: Bool = false) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "mp3") else {
            print("Sound file not found: \(sound)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = loop ? -1 : 0 // -1 for infinite loop, 0 for no loop
            audioPlayer?.play()
            isPlaying = true // Update the isPlaying flag
        } catch {
            print("Failed to play sound: \(error.localizedDescription)")
        }
    }

    func stopSound() {
        audioPlayer?.stop()
        isPlaying = false // Update the isPlaying flag
    }
}
