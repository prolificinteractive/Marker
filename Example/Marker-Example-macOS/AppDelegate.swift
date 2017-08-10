//
//  AppDelegate.swift
//  Marker-Example-macOS
//
//  Created by Michael Campbell on 5/24/17.
//
//

import Cocoa

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {

    private var window: NSWindow?
    private(set) var mainWindowController: NSWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setupWindow()
        presentMainView()
    }

    private func setupWindow() {
        guard let currentScreen = NSScreen.main else {
            return
        }

        let windowRect = NSRect(x: 0,
                                y: 0,
                                width: 320,
                                height: 568)
        window = NSWindow(contentRect: windowRect,
                          styleMask: [.closable, .closable, .miniaturizable, .titled, .resizable],
                          backing: .buffered,
                          defer: false,
                          screen: currentScreen)
        window?.title = "Marker"
        window?.center()
        window?.isOpaque = true
        window?.isMovableByWindowBackground = true
        window?.contentMinSize = NSSize(width: 320, height: 568)
        window?.contentMaxSize = NSSize(width: 414, height: 736)
    }

    private func presentMainView() {
        let bundle = Bundle(for: ViewController.self)
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: bundle)
        guard let viewController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "ViewController"))
            as? ViewController else {
                return
        }

        viewController.theme = AppTheme()

        mainWindowController = NSWindowController(window: window)
        mainWindowController?.contentViewController = viewController
        mainWindowController?.showWindow(window)
        window?.makeKeyAndOrderFront(self)
    }

}

