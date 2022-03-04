//CollisionManager.swift
//Name: Ishtiaque Ahmed
//StudentID: 301223010
//Date: March 4th, 2022
//App Description: This is a mail pilot app that was initially working only as portrait mode on simulator. According to the midterm test instruction, the app needed to be adjusted to work in landscape mode. All the components appear from right side of the screen. The plane is on the left side of the landscape screen that scrolls top-bottom. The islands appear from the right side of the screen to the left. The ocean scrolls from screen's right to left, now there are 2 clouds with horizontal speed and vertical drift.
//Version: Mail Pilot 1.1

import SpriteKit
import GameplayKit

class CollisionManager
{
    public static var gameViewController: GameViewController?
    
    // Utility Function
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) -> Void
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        if(SquaredDistance(point1: P1, point2: P2) < Radii * Radii)
        {
            // we have a collision here
            if(!object2.isCollding!)
            {
                
                switch(object2.name)
                {
                case "island":
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    break
                case "cloud":
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    break
                default:
                    break
                }
                object2.isCollding = true
            }
        }
    }
}
