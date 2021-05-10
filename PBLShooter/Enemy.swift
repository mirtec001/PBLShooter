//
//  Enemy.swift
//  PBLShooter
//
//  Created by Pete Misik on 5/7/21.
//

import SpriteKit
import GameplayKit



class Enemy: SKSpriteNode {
    
    init() {
        super.init(texture: nil, color: .red, size: CGSize(width: 40, height: 20))
        self.name = "enemy"
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 20))
        self.physicsBody?.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func newEnemy() -> Enemy {
        self.position = CGPoint(x: CGFloat.random(in: 600...2500), y: CGFloat.random(in: 0...900))
        self.speed = CGFloat.random(in: 1..<5)
        
        return self
    }
}
