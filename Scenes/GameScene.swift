//GameScene.swift
//Name: Ishtiaque Ahmed
//StudentID: 301223010
//Date: March 4th, 2022
//App Description: This is a mail pilot app that was initially working only as portrait mode on simulator. According to the midterm test instruction, the app needed to be adjusted to work in landscape mode. All the components appear from right side of the screen. The plane is on the left side of the landscape screen that scrolls top-bottom. The islands appear from the right side of the screen to the left. The ocean scrolls from screen's right to left, now there are 2 clouds with horizontal speed and vertical drift. If the plane touches an island, player gets 100 score; if the plane touches a cloud player loses 1 life.
//Version: Mail Pilot 1.1

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    var gameManager: GameManager?
    
    // instance variables
    var ocean: Ocean?
    var island: Island?
    var plane: Plane?
    var clouds: [Cloud] = []
      
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        // add ocean to the scene
        ocean = Ocean() // allocate memory
        ocean?.position = CGPoint(x: 773, y: 0)                     //flipping positions
        addChild(ocean!) // add the ocean to the scene
        
        // add island to the scene
        island = Island()
        addChild(island!)

        // add plane to the scene
        plane = Plane()
        plane?.position = CGPoint(x: -555, y: 0)    //changed x and y
        addChild(plane!)
        
        // add 3 clouds to the scene
        for index in 0...1                  //making 2 clouds instead of 3
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
        // Sounds
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        // preload / prewarm impulse
        do{
            let sounds:[String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch
        {
            
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint)        //changed x and y similar way
    {
        plane?.TouchMove(newPos: CGPoint(x: -555, y: pos.y))    //changed pos to 555
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -555, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: -555, y: pos.y))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean?.Update()
        island?.Update()
        plane?.Update()
        
        // update each cloud in clouds
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: cloud )
        }
        
        CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: island!)
        
        if(ScoreManager.Lives < 1)
        {
            gameManager?.PresentEndScene()
        }
    }
}
