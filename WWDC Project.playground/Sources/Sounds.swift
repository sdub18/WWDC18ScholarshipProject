import UIKit
import AVFoundation
import PlaygroundSupport

// MARK: This Class is responsible for all of the discussions Ethan has with the user. This retrieves and plays the audio from the program
public class Sounds {
    
    public static let instance = Sounds()
    var player: AVAudioPlayer?
    
    public func talk(soundFileName: String) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "m4a") else { return }
        
        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
//            try AVAudioSession.sharedInstance().setActive(true)
//            
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//            
//            guard let player = player else { return }
//            
//            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
