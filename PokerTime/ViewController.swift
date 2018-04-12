//
//  ViewController.swift
//  PokerTime
//
//  Created by Tomi Lahtinen on 11/04/2018.
//  Copyright © 2018 Tomi Lahtinen. All rights reserved.
//

import UIKit
import LCDView

class ViewController: UIViewController {
    
    let levelTime = 12 * 60 // Seconds
    let smallBlindStart = 25 // Big blind = 2 x small blind
    
    var timeDelta: Double = 0
    var style: Style = Styles.green {
        didSet {
            timerView.dotOnColor = style.onColor
            timerView.dotOffColor = style.offColor
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if paused {
            reset()
        }
    }
    
    @IBOutlet weak var resetButton: UIButton!
    
    var currentLevel = 1 {
        didSet {
            smallBlindView.caption = String(format: "%4d", smallBlindStart * currentLevel)
            bigBlindView.caption = String(format: "%4d", (smallBlindStart * 2) * currentLevel)
        }
    }
    
    var remainingTime = 0 {
        didSet {
            let minutes = remainingTime / 60
            let seconds = remainingTime - minutes * 60
            timerView.caption = String(format: "%02d", minutes) + (seconds % 2 == 0 ? ":" : " ") + String(format: "%02d", seconds)
        }
    }
    var paused = true {
        didSet {
            resetButton.isHidden = !paused
        }
    }
    
    
    
    @IBOutlet weak var timerView: LCDView!
    @IBOutlet weak var smallBlindView: LCDView!
    @IBOutlet weak var bigBlindView: LCDView!
    
    private func reset() {
        currentLevel = 1
        remainingTime = levelTime
        paused = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timerView.caption = "12:00"
        smallBlindView.caption = "25"
        bigBlindView.caption = "50"
        addTapRecognizer()
        reset()
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func update() {
        let now = floor(Date().timeIntervalSince1970)
        if now - timeDelta >= 1 {
            timeDelta = now
            if !paused {
                remainingTime -= 1
            }
            
            if remainingTime == 0 {
                currentLevel = currentLevel * 2
                remainingTime = levelTime
                style = Styles.green
            }
            
            if remainingTime < 60 {
                style = Styles.red
            }
        }
        //debugPrint("time delta", timeDelta, "now", now)
    }
    
    @objc private func togglePaused() {
        paused = !paused
    }
    
    func addTapRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.togglePaused))
        tap.cancelsTouchesInView = false
        timerView.addGestureRecognizer(tap)
    }
}
