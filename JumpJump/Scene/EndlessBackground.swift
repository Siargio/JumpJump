//
//  EndlessBackground.swift
//  JumpJump
//
//  Created by Sergio on 5.12.22.
//

import SpriteKit

class EndlessBackground {
    unowned let parent: SKScene

    var sprite1: SKSpriteNode
    var sprite2: SKSpriteNode

    var speed: CGFloat
    var viewSize: CGSize

    init(parent _parent: SKScene, sprite _sprite: SKSpriteNode, speed _speed: CGFloat) {
        self.parent = _parent
        self.speed = _speed
        viewSize = parent.size

        sprite1 = _sprite.copy() as! SKSpriteNode
        sprite1.position = CGPoint(x: 0, y: 0)

        sprite2 = _sprite.copy() as! SKSpriteNode
        sprite2.position = CGPoint(x: viewSize.width, y: 0)

        parent.addChild(sprite1)
        parent.addChild(sprite2)
    }

    func update() {
        sprite1.position.x -= speed
        sprite2.position.x -= speed

        if sprite1.position.x < -viewSize.width {
            sprite1.position.x = sprite2.position.x + viewSize.width
        }

        if sprite2.position.x < -viewSize.width {
            sprite2.position.x = sprite1.position.x + viewSize.width
        }
    }

    func stop() {
        speed = 0
    }
}
