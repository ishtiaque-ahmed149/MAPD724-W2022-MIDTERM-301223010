//AppDelegate.swift
//Name: Ishtiaque Ahmed
//StudentID: 301223010
//Date: March 4th, 2022
//App Description: This is a mail pilot app that was initially working only as portrait mode on simulator. According to the midterm test instruction, the app needed to be adjusted to work in landscape mode. All the components appear from right side of the screen. The plane is on the left side of the landscape screen that scrolls top-bottom. The islands appear from the right side of the screen to the left. The ocean scrolls from screen's right to left, now there are 2 clouds with horizontal speed and vertical drift.
//Version: Mail Pilot 1.1

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

