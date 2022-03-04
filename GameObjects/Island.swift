//Island.swift
//Name: Ishtiaque Ahmed
//StudentID: 301223010
//Date: March 4th, 2022
//App Description: This is a mail pilot app that was initially working only as portrait mode on simulator. According to the midterm test instruction, the app needed to be adjusted to work in landscape mode. All the components appear from right side of the screen. The plane is on the left side of the landscape screen that scrolls top-bottom. The island appears from the right side of the screen to the left. The ocean scrolls from screen's right to left, now there are 2 clouds with horizontal speed and vertical drift.
//Version: Mail Pilot 1.1

import GameplayKit
import SpriteKit

class Island : GameObject
{
    
    // constructor / initializer
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        if(position.y <= -730)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 730
        // get a pseudo random number -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 616))! - 313
        position.x = CGFloat(randomX)
        isCollding = false
    }
    
    // initialization
    override func Start()
    {
        Reset()
        zPosition = 1
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
    }
}
