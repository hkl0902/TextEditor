//
//  AppDelegate.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 12/31/16.
//  Copyright © 2016 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

let del = AppDelegate()
let app = NSApplication.shared()
app.mainMenu = AppMainMenu()
app.delegate = del
app.run()

