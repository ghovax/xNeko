//
//  NekoApp.swift
//  Neko
//
//  Created by Giovanni Gravili on 17/07/23.
//

import SwiftUI

class SettingsData: ObservableObject {
    @Published var selectedItem = "Neko"
}

@main
struct NekoApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    private var settingsData = SettingsData()
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().fixedSize().frame(minWidth: 40, maxWidth: 40, minHeight: 40, maxHeight: 40)
                .edgesIgnoringSafeArea(.all).environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(settingsData)
        }
        .windowStyle(.hiddenTitleBar)
        // .windowResizability(.contentSize)
#if os(macOS)
        Settings {
            SettingsView().environmentObject(settingsData)
        }
#endif
    }
}

struct SettingsView: View {
    @State var options = ["Neko", "Sakura", "Dog", "Tomoyo", "BSD Demon", "Tora"]
    
    @EnvironmentObject var settingsData: SettingsData
    
    var body: some View {
        Picker("Select a character", selection: $settingsData.selectedItem) { // 3
            ForEach(options, id: \.self) { item in // 4
                Text(item) // 5
            }
        }
        .padding(20)
        .frame(width: 275, height: 75)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        hideTitleBar()
    }
    
    func hideTitleBar() {
        guard let window = NSApplication.shared.windows.first else {
            assertionFailure();
            return
        }
        
        // NSApp.activate(ignoringOtherApps: true)
        NSApplication.shared.activate(ignoringOtherApps: true)
        // window.orderFrontRegardless()
        
        // window.styleMask = .fullSizeContentView
        window.setFrame(NSRect(x: (window.screen?.frame.width)! / 2, y: (window.screen?.frame.height)! / 2, width: 40, height: 40), display: true)
        window.backingType = .buffered
        window.canHide = true
        window.level = .floating
        window.isMovableByWindowBackground = false
        window.ignoresMouseEvents = true
        window.isOpaque = false
        window.titlebarAppearsTransparent = true
        window.backgroundColor = .clear
        window.hasShadow = false
        window.styleMask.remove(.resizable)
        
        let closeButton = window.standardWindowButton(.closeButton)!
        closeButton.isEnabled = false
        closeButton.isHidden = true
        
        let miniButton = window.standardWindowButton(.miniaturizeButton)!
        miniButton.isHidden = true
        miniButton.isEnabled = false
        
        let zoomButton = window.standardWindowButton(.zoomButton)!
        zoomButton.isHidden = true
        zoomButton.isEnabled = false
    }
}
