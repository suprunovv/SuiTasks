//
//  PlayerViewModel.swift
//  SuiTasks
//
//  Created by MacBookPro on 01.05.2024.
//
import AVFoundation
import Foundation
///  Вью модель плеера
final class PlayerViewModel: ObservableObject {
    
    @Published var maxDuration: Float = 0.0
    @Published var currentDuration: Float = 0.0
    @Published var currentTime = "00:00"
    var isPlay = false
    var timer: Timer?
    var currentSong: Song {
        songs[currentIndex]
    }
    private var currentIndex = 0
    private var songs: [Song] = [Song(name: "Бесится",
                                      imageName: "toxis",
                                      autor: "Toxi$",
                                      autorImage: "toxis",
                                      fileName: "toxi-besitsya"),
                                 Song(name: "Купола",
                                      imageName: "krug",
                                      autor: "Михаил Круг",
                                      autorImage: "krug2",
                                      fileName: "mikhail-krug-kupola")]
    private var player: AVAudioPlayer?
    
    func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        currentDuration = Float(time)
        player?.currentTime = time
    }
    
    func startPlay() {
        isPlay.toggle()
        guard player != nil else {
            playSong(name: songs[currentIndex].fileName)
            playing()
            return
        }
        playing()
    }
    
    func backTrack() {
        player?.stop()
        timer?.invalidate()
        currentIndex -= 1
            
        if currentIndex < 0 {
            currentIndex = songs.count - 1
        }
        playSong(name: currentSong.fileName)
        playing()
    }
    
    func nextTrack() {
        player?.stop()
        timer?.invalidate()
        currentIndex += 1
        
        if currentIndex >= songs.count {
            currentIndex = 0
        }
        playSong(name: currentSong.fileName)

        playing()
    }
    
    private func playing() {
        if isPlay {
            player?.play()
        }
        else {
            player?.pause()
        }
    }
    
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = Float(player?.duration ?? 0)
            player?.prepareToPlay()
        } catch {
            print(error.localizedDescription)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.5,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
        if let player {
            currentDuration = Float(player.currentTime)
        }
    }
    
    @objc private func updateTime() {
        if let player {
            let time = Int(player.currentTime)
            let minets = time / 60
            let second = time % 60
            
            currentTime = NSString(format: "%02d:%02d", minets, second) as String
            currentDuration = Float(player.currentTime)
            
        }
    }
}
