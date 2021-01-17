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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
        /// create a plane for exact size of ref image
        let ref = imageAnchor.referenceImage.physicalSize
        let plane = SCNPlane(width: ref.width * 2.1, height: ref.height * 2.1)
        
        /// make plane transparent blue
        let cardView = UIHostingController(rootView: CardDetailsView()).view!
        cardView.frame = CGRect(x: 0, y: -20, width: 1000, height: 1000)
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
    
    // MARK: - ARSCNViewDelegate
    
}
