//
//  GameScene.swift
//  Marbles
//
//  Created by AMStudent on 11/23/21.
//

import SpriteKit

class Marble: SKSpriteNode { }

class GameScene: SKScene {
    
    var marbles = ["marbleBlue", "marbleGreen", "marblePurple", "marbleRed", "marbleYellow"]
    
    let scoreLabel = SKLabelNode(fontNamed: "HelveticaNeue-Thin")
    
    override func didMove(to view: SKView) {
        
        let marble = SKSpriteNode(imageNamed: "marbleBlue")
        let marbleRadius = marble.frame.width / 2.0
        
        scoreLabel.fontSize = 72
        scoreLabel.position = CGPoint(x: 20, y: 20)
        scoreLabel.text = "SCORE: 0"
        scoreLabel.zPosition = 100
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        for i in stride(from: marbleRadius, to: view.bounds.width - marbleRadius, by: marble.frame.width) {
            for j in stride(from: 100, to: view.bounds.height, by: marble.frame.height) {
                let marbleType = marbles.randomElement()!
                let marble = Marble(imageNamed: marbleType)
                marble.position = CGPoint(x: i, y: j)
                marble.name = marbleType
                
                
                marble.physicsBody = SKPhysicsBody(circleOfRadius: marbleRadius)
                marble.physicsBody?.allowsRotation = false
                marble.physicsBody?.friction = 0
                marble.physicsBody?.restitution = 0
                
                addChild(marble)
            }
        }
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)))
        
    }
    

    override func update(_ currentTime: TimeInterval) {
        
    }
}
