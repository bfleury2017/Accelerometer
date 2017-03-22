//
//  AppDelegate.swift
//  Accelerometer
//
//  Created by Brian on 3/21/17.
//  Copyright © 2017 NHTI. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var motionManager = CMMotionManager()
    var player = AVAudioPlayer()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        startAccel()
        
        return true
    }

    func startAccel() {
        motionManager.accelerometerUpdateInterval = 0.005
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) {
            (data, error) in
            if let myData = data {
                if myData.userAcceleration.y > 0.6 {
                    SoundPlayer.sharedInstance.playSound()
                }
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

