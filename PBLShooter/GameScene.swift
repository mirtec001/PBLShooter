//
//  GameScene.swift
//  PBLShooter
//
//  Created by Pete Misik on 5/7/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let mySprite = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
    var xSpeed: CGFloat = 0
    var ySpeed: CGFloat = 0
    
    
    
    var velocity: CGFloat = 100
    
    var positionX: CGFloat = 300
    var positionY: CGFloat = 300
    
    var enemySprites: [SKSpriteNode] = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        mySprite.position = CGPoint(x: xSpeed, y: ySpeed)
        
        self.addChild(mySprite)
        
        for _ in 0..<20 {

            let enemySprite: Enemy = Enemy().newEnemy()
            addChild(enemySprite)
            enemySprites.append(enemySprite)

        }
    }
    
    
    
    override func keyDown(with event: NSEvent) {
        switch event.characters {
        case " ": // Spacebar -- keep for shooting
            print("Something happened")
        case "w": // W - up
            print("move up")
            ySpeed = velocity
            break
        case "s": // S - down
            print("move down")
            ySpeed = -velocity
            break
        case "d": // D - right
            print("move right")
            xSpeed = velocity
            break
        case "a": // a - left
            print("move left")
            xSpeed = -velocity
            break
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    override func keyUp(with event: NSEvent) {
        switch event.characters {
        case "w":
            ySpeed = 0
            break
        case "s":
            ySpeed = 0
            break
        case "a":
            xSpeed = 0
            break
        case "d":
            xSpeed = 0
            break
        default:
            print(":-P")
        
        }
    }
    
    var lastUpdate: TimeInterval!
    
    
    override func update(_ currentTime: TimeInterval) {
        
        defer { lastUpdate = currentTime }
        guard lastUpdate != nil else { return }
        
        let dt = currentTime - lastUpdate
        
        guard dt < 1 else {
            return
        }
        // Called before each frame is rendered
        mySprite.position.x += (xSpeed * CGFloat(dt) )
        mySprite.position.y += (ySpeed * CGFloat(dt) )
        
        for (i, enemy) in enemySprites.enumerated() {
            enemy.position.x -= enemy.speed
            
            if enemy.position.x <= -1000 {
                enemySprites.remove(at: i)
                if let child = self.childNode(withName: "enemy") as? SKSpriteNode {
                    child.removeFromParent()
                }
                let enemySprite = Enemy().newEnemy()
                addChild(enemySprite)
                enemySprites.append(enemySprite)
            }
        }
    }
}
