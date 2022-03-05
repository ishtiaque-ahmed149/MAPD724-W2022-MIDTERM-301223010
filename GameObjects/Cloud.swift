//Cloud.swift
//Name: Ishtiaque Ahmed
//StudentID: 301223010
//Date: March 4th, 2022
//App Description: This is a mail pilot app that was initially working only as portrait mode on simulator. According to the midterm test instruction, the app needed to be adjusted to work in landscape mode. All the components appear from right side of the screen. The plane is on the left side of the landscape screen that scrolls top-bottom. The islands appears from the right side of the screen to the left. The ocean scrolls from screen's right to left, now there are 2 clouds with horizontal speed and vertical drift.
//Version: Mail Pilot 1.1

import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
    // constructor / initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        if(position.x <= -756)    //changing to horizontal
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize vertical speed
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0       //interchanging horizontal and vertical
        
        // randomize horizontal drift
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        
        // get a pseudo random number -262 to 262
        let randomY:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.y = CGFloat(randomY)
        
        // get a pseudo random number 756 to 776
        let randomX:Int = (randomSource?.nextInt(upperBound: 10))! + 756
        position.x = CGFloat(randomX)
        
        isCollding = false
    }
    
    // initialization
    override func Start()
    {
        zPosition = 3
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
