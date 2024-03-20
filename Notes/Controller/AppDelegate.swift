//
//  AppDelegate.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 14/05/23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "NoteItem")
        
        container.loadPersistentStores { storeDesc, error in
            if let error = error {
                fatalError("error \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let pass = pass_func().getPass()
        print(pass)
        var navC: UINavigationController?
        if pass.isEmpty {
            let homeVC = HomeController()
            navC = UINavigationController(rootViewController: homeVC)
        } else {
            let passVC = PasswordController()
            navC = UINavigationController(rootViewController: passVC)
        }
        apperance()
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
        return true
    }
     func apperance() {
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .orange
        UINavigationBar.appearance().backgroundColor = .orange
        UINavigationBar.appearance().scrollEdgeAppearance = apperance
        UINavigationBar.appearance().standardAppearance = apperance
    }
    
    func savecontext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch  {
                let nserror = error as NSError
                fatalError("error saving \(nserror.localizedDescription)")
            }
        }
    }
}

