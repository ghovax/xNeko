//
//  ContentView.swift
//  Neko
//
//  Created by Giovanni Gravili on 17/07/23.
//

import SwiftUI

func createImageArray(imageNames: NSArray) -> NSArray {
    let images = NSMutableArray()
    
    for imageName in imageNames {
        let image = NSImage(named: imageName as! NSImage.Name)
        images.add(image as Any)
    }
    
    return images;
}

struct ContentView: View {
    // @Environment(\.managedObjectContext) private var viewContext
    
    @EnvironmentObject var settingsData: SettingsData
    
    @State private var image = NSImage(named: "mati2")!
    @State private var animations: [String: NSArray]?
    @State private var currentCharacter = "Neko"
    
    @State private var nekoAnimations: [String: NSArray]?
    @State private var sakuraAnimations: [String: NSArray]?
    @State private var dogAnimations: [String: NSArray]?
    @State private var tomoyoAnimations: [String: NSArray]?
    @State private var bsdAnimations: [String: NSArray]?
    @State private var toraAnimations: [String: NSArray]?
    
    @State private var isClicked = false
    
    @State private var tickCount = 0
    @State private var stateCount = 0
    @State private var state: String = "stop"
    @State private var displacement = CGVector()
    
    var body: some View {
        VStack {
            Image(nsImage: image).interpolation(.none)
                .blendMode(BlendMode.sourceAtop) // Pixelated image
                .background(Color.clear)
                .onTapGesture {
                    isClicked.toggle()
                }
                // .imageScale(.medium)
                .aspectRatio(contentMode: .fit)
                .onAppear(perform: {
                    nekoAnimations = [
                        "stop": ["mati2"],
                        "jare": ["jare2", "mati2"],
                        "kaki": ["kaki1", "kaki2"],
                        "akubi": ["mati3"],
                        "sleep": ["sleep1", "sleep2"],
                        "awake": ["awake"],
                        "umove": ["up1", "up2"],
                        "dmove": ["down1", "down2"],
                        "lmove": ["left1", "left2"],
                        "rmove": ["right1", "right2"],
                        "ulmove": ["upleft1", "upleft2"],
                        "urmove": ["upright1", "upright2"],
                        "dlmove": ["dwleft1", "dwleft2"],
                        "drmove": ["dwright1", "dwright2"],
                        "utogi": ["utogi1", "utogi2"],
                        "dtogi": ["dtogi1", "dtogi2"],
                        "ltogi": ["ltogi1", "ltogi2"],
                        "rtogi": ["rtogi1", "rtogi2"],
                    ].mapValues { createImageArray(imageNames: $0) }
                    
                    sakuraAnimations = [
                        "stop": ["mati2_sakura"],
                        "jare": ["jare2_sakura", "mati2_sakura"],
                        "kaki": ["kaki1_sakura", "kaki2_sakura"],
                        "akubi": ["mati3_sakura"],
                        "sleep": ["sleep1_sakura", "sleep2_sakura"],
                        "awake": ["awake_sakura"],
                        "umove": ["up1_sakura", "up2_sakura"],
                        "dmove": ["down1_sakura", "down2_sakura"],
                        "lmove": ["left1_sakura", "left2_sakura"],
                        "rmove": ["right1_sakura", "right2_sakura"],
                        "ulmove": ["upleft1_sakura", "upleft2_sakura"],
                        "urmove": ["upright1_sakura", "upright2_sakura"],
                        "dlmove": ["dwleft1_sakura", "dwleft2_sakura"],
                        "drmove": ["dwright1_sakura", "dwright2_sakura"],
                        "utogi": ["utogi1_sakura", "utogi2_sakura"],
                        "dtogi": ["dtogi1_sakura", "dtogi2_sakura"],
                        "ltogi": ["ltogi1_sakura", "ltogi2_sakura"],
                        "rtogi": ["rtogi1_sakura", "rtogi2_sakura"],
                    ].mapValues { createImageArray(imageNames: $0) }
                    
                    dogAnimations = [
                        "stop": ["mati2_dog"],
                        "jare": ["jare2_dog", "mati2_dog"],
                        "kaki": ["kaki1_dog", "kaki2_dog"],
                        "akubi": ["mati3_dog"],
                        "sleep": ["sleep1_dog", "sleep2_dog"],
                        "awake": ["awake_dog"],
                        "umove": ["up1_dog", "up2_dog"],
                        "dmove": ["down1_dog", "down2_dog"],
                        "lmove": ["left1_dog", "left2_dog"],
                        "rmove": ["right1_dog", "right2_dog"],
                        "ulmove": ["upleft1_dog", "upleft2_dog"],
                        "urmove": ["upright1_dog", "upright2_dog"],
                        "dlmove": ["dwleft1_dog", "dwleft2_dog"],
                        "drmove": ["dwright1_dog", "dwright2_dog"],
                        "utogi": ["utogi1_dog", "utogi2_dog"],
                        "dtogi": ["dtogi1_dog", "dtogi2_dog"],
                        "ltogi": ["ltogi1_dog", "ltogi2_dog"],
                        "rtogi": ["rtogi1_dog", "rtogi2_dog"],
                    ].mapValues { createImageArray(imageNames: $0) }
                    
                    tomoyoAnimations = [
                        "stop": ["mati2_tomoyo"],
                        "jare": ["jare2_tomoyo", "mati2_tomoyo"],
                        "kaki": ["kaki1_tomoyo", "kaki2_tomoyo"],
                        "akubi": ["mati3_tomoyo"],
                        "sleep": ["sleep1_tomoyo", "sleep2_tomoyo"],
                        "awake": ["awake_tomoyo"],
                        "umove": ["up1_tomoyo", "up2_tomoyo"],
                        "dmove": ["down1_tomoyo", "down2_tomoyo"],
                        "lmove": ["left1_tomoyo", "left2_tomoyo"],
                        "rmove": ["right1_tomoyo", "right2_tomoyo"],
                        "ulmove": ["upleft1_tomoyo", "upleft2_tomoyo"],
                        "urmove": ["upright1_tomoyo","upright2_tomoyo"],
                        "dlmove": ["dwleft1_tomoyo", "dwleft2_tomoyo"],
                        "drmove": ["dwright1_tomoyo", "dwright2_tomoyo"],
                        "utogi": ["utogi1_tomoyo", "utogi2_tomoyo"],
                        "dtogi": ["dtogi1_tomoyo", "dtogi2_tomoyo"],
                        "ltogi": ["ltogi1_tomoyo", "ltogi2_tomoyo"],
                        "rtogi": ["rtogi1_tomoyo", "rtogi2_tomoyo"],
                    ].mapValues { createImageArray(imageNames: $0) }
                    
                    bsdAnimations = [
                        "stop": ["mati2_bsd"],
                        "jare": ["jare2_bsd", "mati2_bsd"],
                        "kaki": ["kaki1_bsd", "kaki2_bsd"],
                        "akubi": ["mati3_bsd"],
                        "sleep": ["sleep1_bsd", "sleep2_bsd"],
                        "awake": ["awake_bsd"],
                        "umove": ["up1_bsd", "up2_bsd"],
                        "dmove": ["down1_bsd", "down2_bsd"],
                        "lmove": ["left1_bsd", "left2_bsd"],
                        "rmove": ["right1_bsd", "right2_bsd"],
                        "ulmove": ["upleft1_bsd", "upleft2_bsd"],
                        "urmove": ["upright1_bsd","upright2_bsd"],
                        "dlmove": ["dwleft1_bsd", "dwleft2_bsd"],
                        "drmove": ["dwright1_bsd", "dwright2_bsd"],
                        "utogi": ["utogi1_bsd", "utogi2_bsd"],
                        "dtogi": ["dtogi1_bsd", "dtogi2_bsd"],
                        "ltogi": ["ltogi1_bsd", "ltogi2_bsd"],
                        "rtogi": ["rtogi1_bsd", "rtogi2_bsd"],
                    ].mapValues { createImageArray(imageNames: $0) }
                    
                    toraAnimations = [
                        "stop": ["mati2_tora"],
                        "jare": ["jare2_tora", "mati2_tora"],
                        "kaki": ["kaki1_tora", "kaki2_tora"],
                        "akubi": ["mati3_tora"],
                        "sleep": ["sleep1_tora", "sleep2_tora"],
                        "awake": ["awake_tora"],
                        "umove": ["up1_tora", "up2_tora"],
                        "dmove": ["down1_tora", "down2_tora"],
                        "lmove": ["left1_tora", "left2_tora"],
                        "rmove": ["right1_tora", "right2_tora"],
                        "ulmove": ["upleft1_tora", "upleft2_tora"],
                        "urmove": ["upright1_tora","upright2_tora"],
                        "dlmove": ["dwleft1_tora", "dwleft2_tora"],
                        "drmove": ["dwright1_tora", "dwright2_tora"],
                        "utogi": ["utogi1_tora", "utogi2_tora"],
                        "dtogi": ["dtogi1_tora", "dtogi2_tora"],
                        "ltogi": ["ltogi1_tora", "ltogi2_tora"],
                        "rtogi": ["rtogi1_tora", "rtogi2_tora"],
                    ].mapValues { createImageArray(imageNames: $0) }
                    
                    animations = nekoAnimations
                    
                    Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { _ in
                        timerAction()
                    }
                })
        }
        .background(Color.clear)
        .frame(width: 32 + 8, height: 32 + 8)
    }
    
    func setStateTo(_ animationName: String) {
        if state == animationName {
            return
        }
        state = animationName
        tickCount = 0
        stateCount = 0
    }
    
    func calculateDisplacement(frameOrigin: CGVector) {
        let mouse = NSEvent.mouseLocation
        let delta = CGVector(dx: floor(Double(Float(mouse.x) - Float(frameOrigin.dx)) - 20.0), dy: Double(floor(Float(mouse.y) - Float(frameOrigin.dy)) - 45.0))
        
        let length = hypotf(Float(delta.dx), Float(delta.dy))
        
        if (length != 0.0) {
            if (length <= 13.0) {
                displacement = delta
            } else {
                displacement = (CGFloat(13.0) * delta) / CGFloat(length)
            }
        } else {
            displacement = CGVector()
        }
    }
    
    func advanceClock() {
        tickCount += 1
        if tickCount >= 255 {
            tickCount = 0
        }
        
        if tickCount % 2 == 0 {
            if stateCount < 255 {
                stateCount += 1
            }
        }
    }
    
    func setImageTo(imageObject: NSImage) {
        if image == imageObject {
            return
        }
        image = imageObject
    }
    
    func calculateDirection() {
        if displacement == CGVector(dx: 0.0, dy: 0.0) {
            setStateTo("stop")
        } else {
            let length = hypotf(Float(displacement.dx), Float(displacement.dy))
            let sinTheta = Float(displacement.dy) / length
            
            if displacement.dx > 0 {
                if sinTheta > 0.9239 {
                    setStateTo("umove")
                } else if sinTheta > 0.3827 {
                    setStateTo("urmove")
                } else if sinTheta > -0.3827 {
                    setStateTo("rmove")
                } else if sinTheta > -0.9239 {
                    setStateTo("drmove")
                } else {
                    setStateTo("dmove")
                }
            } else {
                if sinTheta > 0.9239 {
                    setStateTo("umove")
                } else if sinTheta > 0.3827 {
                    setStateTo("ulmove")
                } else if sinTheta > -0.3827 {
                    setStateTo("lmove")
                } else if sinTheta > -0.9239 {
                    setStateTo("dlmove")
                } else {
                    setStateTo("dmove")
                }
            }
        }
    }
    
    func timerAction() {
        guard let window = NSApplication.shared.windows.first else {
            assertionFailure();
            return
        }
        
        let selectedCharacter = settingsData.selectedItem
        
        if selectedCharacter != currentCharacter {
            currentCharacter = selectedCharacter
            if selectedCharacter == "Neko" {
                animations = nekoAnimations
            } else if selectedCharacter == "Sakura" {
                animations = sakuraAnimations
            } else if selectedCharacter == "Dog" {
                animations = dogAnimations
            } else if selectedCharacter == "Tomoyo" {
                animations = tomoyoAnimations
            } else if selectedCharacter == "BSD Demon" {
                animations = bsdAnimations
            } else if selectedCharacter == "Tora" {
                animations = toraAnimations
            } else {
                assertionFailure()
            }
        }
        
        DispatchQueue.main.async {
            var position = CGVector(dx: window.frame.origin.x, dy: window.frame.origin.y)
            calculateDisplacement(frameOrigin: position)
            
            let shouldBeMoving = displacement.dx > 10 || displacement.dx < -10 || displacement.dy > 10 || displacement.dy < -10
            
            let imageArray = animations![state]!
            if state != "sleep" {
                setImageTo(imageObject: imageArray.object(at: tickCount % imageArray.count) as! NSImage)
            } else {
                setImageTo(imageObject: imageArray.object(at: (tickCount >> 2) % imageArray.count) as! NSImage)
            }
            
            advanceClock()
            
            if state == "stop" {
                if shouldBeMoving {
                    setStateTo("awake")
                } else if (stateCount < 2) {
                    // Do nothing
                } else {
                    setStateTo("jare")
                }
            } else if state == "jare" {
                if shouldBeMoving {
                    setStateTo("awake")
                } else if stateCount < 2 {
                    // Do nothing
                } else {
                    setStateTo("kaki")
                }
            } else if state == "kaki" {
                if shouldBeMoving {
                    setStateTo("awake")
                } else if stateCount < 4 {
                    // Do nothing
                } else {
                    setStateTo("akubi")
                }
            } else if state == "akubi" {
                if shouldBeMoving {
                    setStateTo("awake")
                } else if stateCount < 2 {
                    // Do nothing
                } else {
                    setStateTo("sleep")
                }
            } else if state == "sleep" {
                if shouldBeMoving {
                    setStateTo("awake")
                }
            } else if state == "awake" { // Controls first wait before moving after stopping
                if stateCount < 2 {
                    // Do nothing
                } else {
                    calculateDirection()
                }
            } else if ["umove", "dmove", "lmove", "rmove", "ulmove", "urmove", "dlmove", "drmove"].contains(state) {
                position += displacement
                calculateDirection()
            } else if ["utogi", "ltogi", "dtogi", "rtogi"].contains(state) {
                if shouldBeMoving {
                    setStateTo("awake")
                } else if stateCount < 6 {
                    // Do nothing
                } else {
                    setStateTo("kaki")
                }
            } else {
                setStateTo("stop")
            }
            
            window.displayIfNeeded()
            window.setFrameOrigin(NSPoint(x: position.dx, y: position.dy))
        }
    }
}

infix operator * : MultiplicationPrecedence
infix operator / : MultiplicationPrecedence

extension CGVector {
    // Scalar-vector multiplication
    public static func * (left: CGFloat, right: CGVector) -> CGVector {
        return CGVector(dx: right.dx * left, dy: right.dy * left)
    }
    
    // Vector-scalar division
    public static func / (left: CGVector, right: CGFloat) -> CGVector {
        guard right != 0 else { fatalError("Division by zero") }
        return CGVector(dx: left.dx / right, dy: left.dy / right)
    }
}

extension CGVector: AdditiveArithmetic {
    // Vector addition
    public static func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    // Vector subtraction
    public static func - (left: CGVector, right: CGVector) -> CGVector {
        return left + (-right)
    }
    
    // Vector addition assignment
    public static func += (left: inout CGVector, right: CGVector) {
        left = left + right
    }
    
    // Vector subtraction assignment
    public static func -= (left: inout CGVector, right: CGVector) {
        left = left - right
    }
    
    // Vector negation
    public static prefix func - (vector: CGVector) -> CGVector {
        return CGVector(dx: -vector.dx, dy: -vector.dy)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().padding(0.0).frame(width: 32.0, height: 32.0).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
