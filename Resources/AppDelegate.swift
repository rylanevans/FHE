//
//  AppDelegate.swift
//  FHE
//
//  Created by Rylan Evans on 9/18/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let tabBar = self.window?.rootViewController as? UITabBarController {
            tabBar.selectedIndex = 2
        }
        
//        increaseCounter()
        
        return true
    }
    
//    func increaseCounter() {
//
//        if Counter == nil (if there are no Counter entities) {
//        //            create one and all task objects
//        //            if there is a counter just add 1 to the attribute
//
//        let openingPrayer = Task(context: context)
//        openingPrayer.name = "Opening Prayer"
//        openingPrayer.assigned = false
//        //        song.assignment = IDK???
//        openingPrayer.defaultNumber = Int64(arc4random_uniform(101))
//        openingPrayer.enabled = true
//        openingPrayer.order = 1
//        openingPrayer.segment = 0
//
//        let song = Task(context: context)
//        song.name = "Song"
//        song.assigned = false
////        song.assignment = IDK???
//        song.defaultNumber = Int64(arc4random_uniform(101))
//        song.enabled = true
//        song.order = 2
//        song.segment = 0
//
//        let rule = Task(context: context)
//        rule.name = "Rule"
//        rule.assigned = false
//        //        song.assignment = IDK???
//        rule.defaultNumber = Int64(arc4random_uniform(101))
//        rule.enabled = true
//        rule.order = 3
//        rule.segment = 0
//
//        let scripture = Task(context: context)
//        scripture.name = "Scripture"
//        scripture.assigned = false
//        //        song.assignment = IDK???
//        scripture.defaultNumber = Int64(arc4random_uniform(101))
//        scripture.enabled = true
//        scripture.order = 4
//        scripture.segment = 0
//
//        let calendar = Task(context: context)
//        calendar.name = "Calendar"
//        calendar.assigned = false
//        //        song.assignment = IDK???
//        calendar.defaultNumber = Int64(arc4random_uniform(101))
//        calendar.enabled = true
//        calendar.order = 5
//        calendar.segment = 0
//
//        let testimony = Task(context: context)
//        testimony.name = "Testimony"
//        testimony.assigned = false
//        //        song.assignment = IDK???
//        testimony.defaultNumber = Int64(arc4random_uniform(101))
//        testimony.enabled = true
//        testimony.order = 6
//        testimony.segment = 0
//
//        let spotlight = Task(context: context)
//        spotlight.name = "Spotlight"
//        spotlight.assigned = false
//        //        song.assignment = IDK???
//        spotlight.defaultNumber = Int64(arc4random_uniform(101))
//        spotlight.enabled = true
//        spotlight.order = 7
//        spotlight.segment = 0
//
//        let misc = Task(context: context)
//        misc.name = "Misc"
//        misc.assigned = false
//        //        song.assignment = IDK???
//        misc.defaultNumber = Int64(arc4random_uniform(101))
//        misc.enabled = true
//        misc.order = 8
//        misc.segment = 0
//
//        let thought = Task(context: context)
//        thought.name = "Thought"
//        thought.assigned = false
//        //        song.assignment = IDK???
//        thought.defaultNumber = Int64(arc4random_uniform(101))
//        thought.enabled = true
//        thought.order = 9
//        thought.segment = 0
//
//        let lesson = Task(context: context)
//        lesson.name = "Lesson"
//        lesson.assigned = false
//        //        song.assignment = IDK???
//        lesson.defaultNumber = Int64(arc4random_uniform(101))
//        lesson.enabled = true
//        lesson.order = 10
//        lesson.segment = 0
//
//        let council = Task(context: context)
//        council.name = "Council"
//        council.assigned = false
//        //        song.assignment = IDK???
//        council.defaultNumber = Int64(arc4random_uniform(101))
//        council.enabled = true
//        council.order = 11
//        council.segment = 0
//
//        let closingPrayer = Task(context: context)
//        closingPrayer.name = "Closing Prayer"
//        closingPrayer.assigned = false
//        //        song.assignment = IDK???
//        closingPrayer.defaultNumber = Int64(arc4random_uniform(101))
//        closingPrayer.enabled = true
//        closingPrayer.order = 12
//        closingPrayer.segment = 0
//
//        let game = Task(context: context)
//        game.name = "Game"
//        game.assigned = false
//        //        song.assignment = IDK???
//        game.defaultNumber = Int64(arc4random_uniform(101))
//        game.enabled = true
//        game.order = 13
//        game.segment = 0
//
//        let treat = Task(context: context)
//        treat.name = "Treat"
//        treat.assigned = false
//        //        song.assignment = IDK???
//        treat.defaultNumber = Int64(arc4random_uniform(101))
//        treat.enabled = true
//        treat.order = 14
//        treat.segment = 0
//
//        let counter = Counter(context: context)
//        counter.launched = 1
//
//        ad.saveContext()
//
//    } else {
//        counter.launched += 1
//
//        ad.saveContext()
//    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "FHE")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

let ad = UIApplication.shared.delegate as! AppDelegate
let context = ad.persistentContainer.viewContext


