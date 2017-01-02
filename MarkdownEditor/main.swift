//
//  AppDelegate.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 12/31/16.
//  Copyright © 2016 Hyunkyu Lee. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    let editorWindowController = EditorWindowController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        editorWindowController.showWindow(self)
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

