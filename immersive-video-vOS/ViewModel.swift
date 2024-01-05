import RealityKit
import Observation
import AVFoundation

/// `ViewModel` is a class that manages the content entity and AVPlayer for a media-based application.
/// It provides functionalities to setup and control media playback.
@Observable
class ViewModel {

    /// The main content entity representing the media content in the application.
    private var contentEntity = Entity()

    /// The AVPlayer used for media playback.
    private let avPlayer = AVPlayer()

    /// Sets up the content entity with a video material and prepares it for display.
    /// - Returns: The prepared `Entity` object ready for use.
    func setupContentEntity() -> Entity {
        setupAvPlayer()
        let material = VideoMaterial(avPlayer: avPlayer)

        // Load a sphere entity, scale it, and apply video material.
        let sphere = try! Entity.load(named: "Sphere")
        sphere.scale = .init(x: 1E3, y: 1E3, z: 1E3)

        // Access the model entity within the sphere and assign the video material.
        let modelEntity = sphere
            .children
            .first?
            .children
            .first as! ModelEntity
        modelEntity.model?.materials = [material]

        // Add the sphere to the content entity and adjust its scale.
        contentEntity.addChild(sphere)
        contentEntity.scale *= .init(x: -1, y: 1, z: 1)

        return contentEntity
    }

    /// Starts playback of the media content.
    func play() {
        avPlayer.play()
    }

    /// Pauses playback of the media content.
    func pause() {
        avPlayer.pause()
    }

    /// Configures the AVPlayer with the media asset to be played.
    /// This is a private method used internally by `setupContentEntity`.
    private func setupAvPlayer() {
        let url = Bundle.main.url(forResource: "bonn4k", withExtension: "mp4")
        let asset = AVAsset(url: url!)
        let playerItem = AVPlayerItem(asset: asset)
        avPlayer.replaceCurrentItem(with: playerItem)
    }
}
