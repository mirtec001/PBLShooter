//
//  Bullet.swift
//  PBLShooter
//
//  Created by Peter Misik on 5/8/21.
//

import Foundation
import SpriteKit

class Bullet : SKSpriteNode {
    
    init(_ point: CGPoint) {
        super.init(texture: nil, color: .green, size: CGSize(width: 50, height: 5))
        self.position = point        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func fireBullet() {
        let move = SKAction.moveTo(x: 925, duration: 1)
        self.run(move)
    }
}
