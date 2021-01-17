//
//  ViewController.swift
//  ARKitProject
//
//  Created by Ting Becker on 1/16/21.
//

import UIKit
import SceneKit
import ARKit
import SwiftUI

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    var people: [String: Person] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // load the JSON bundle
        let plsWork = Bundle.main.decode([String: Person].self, from: "resumes.json")
        for (key, value) in plsWork {
            people[key] = value
        }
        
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        // load the cardagain image
        guard let trackingImage = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Couldn't load the cardAGAIN image!")
        }
        
        configuration.trackingImages = trackingImage
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
        
    }
    
    
    // Privates
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let imageAnchor = anchor as? ARImageAnchor else {return nil}
        
//        let resumeName = imageAnchor.referenceImage.name else {return nil}
//        guard let resume = resume
        
        guard let imageName = imageAnchor.referenceImage.name else { return nil }
        
        /// create a plane for exact size of ref image
        let ref = imageAnchor.referenceImage.physicalSize
        let plane = SCNPlane(width: ref.width * 2.75, height: ref.height * 2.75)
        
        /// make plane transparent blue
        let rootView = assignCardData(imageName)
        let cardView = UIHostingController(rootView: rootView).view!
        cardView.frame = CGRect(x: 0, y: -20, width: 1200, height: 1200)
        cardView.backgroundColor = .clear
        cardView.isOpaque = false
        plane.firstMaterial?.diffuse.contents = cardView
        
        /// wrap plane in node and rotate to face us
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        
        // now wrap that in another node = send it back
        let node = SCNNode()
        node.addChildNode(planeNode)
        return node
    }
    
    func assignCardData(_ name: String) -> CardDetailsView? {
        if let person = people[name] {
            // return CardDetailsView with the right values
            let card = CardDetailsView(person: person)
            return card
        } else {
            return nil
        }
    }
    
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
