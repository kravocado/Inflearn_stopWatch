//
//  ViewController.swift
//  StopWatch
//
//  Created by 아보카도맛엔진오일 on 2021/03/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelMinute: UILabel!
    @IBOutlet weak var LabelSecond: UILabel!
    @IBOutlet weak var LabelMillisecond: UILabel!
    
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    var isStarting = false
    
    var timer = Timer()
    
    var startTime = 0.0
    var elapsed = 0.0
    
    @IBAction func startStop(_ sender: Any) {
        
        if isStarting == true {
            // Stop
            startstopButton.setTitle("Start", for: .normal)
            timer.invalidate()

        } else {
            // Start
            startTime = Date().timeIntervalSince1970 - elapsed
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

            startstopButton.setTitle("Stop", for: .normal)
            
        }
        
        
        print("start \(startTime)")
        print("elapsed \(elapsed)")

        isStarting = !isStarting

    }
    
    @IBAction func reset(_ sender: Any) {
        elapsed = 0.0
        startTime = Date().timeIntervalSince1970 - elapsed
        resetDateLabel()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startstopButton.setTitle("Start", for: .normal)
        resetButton.setTitle("reset", for: .normal)
        resetDateLabel()
    }
    
    func resetDateLabel() {
        LabelMinute.text = "00"
        LabelSecond.text = "00"
        LabelMillisecond.text = "00"
    }
    
    @objc func updateCounter() {
        
        elapsed = Date().timeIntervalSince1970 - startTime

        
        let date = Date(timeIntervalSince1970: elapsed)
        let df = DateFormatter()
        
        df.dateFormat = "SS"
        LabelMillisecond.text = df.string(from: date)
        
        df.dateFormat = "ss"
        LabelSecond.text = df.string(from: date)
        
        df.dateFormat = "mm "
        LabelMinute.text = df.string(from: date)
        
    }


}

