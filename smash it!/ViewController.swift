//
//  ViewController.swift
//  smash it!
//
//  Created by aurelia  natasha on 20/05/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var tapBtn: UIButton!
    
    @IBOutlet weak var separateBtnLeft: UIImageView!
    @IBOutlet weak var separateBtnRight: UIImageView!
    
    @IBOutlet weak var retry: UIButton!
    
    
    var score : Int = 0
    var totalScore : Int = 0
    var noClick : Int = 0
    
    var rangeTime : Int = 45
    var time : Int = 12
    var timer = Timer()
    
    var btnLevel : Int = 1
    
    
    var images: [UIImage] = []
    func createImageArr(totalImg: Int){
        for i in 1...totalImg{
            images.append(UIImage(named: "crack\(i)")!)
        }
    }
    
    
    @IBAction func startBtn(_ sender: Any) {
        time = rangeTime
        if time != 0{
            timerLbl.text = "0      \(time)"
            start.isHidden = true
            startTimer()
        }
        else{
            start.isHidden = true
            tapBtn.isEnabled = false
        }
    }
    @IBAction func retryBtn(_ sender: Any) {
//        btnLevel = 0
//        rangeTime = 45
//        totalScore = 0
//        displayScore()
//        noClick = 0
//        scaleButton(button: tapBtn)
//        tapBtn.setImage(UIImage(named: "redBtn"), for: .normal)
//        retry.isHidden = true
//        start.isHidden = false
    }
    
    func calculateTotalScore(){
        let random = Int.random(in: 5...14)
        score = noClick * random
        totalScore += score
    }
    
    func displayScore(){
        if totalScore < 10{
            scoreLbl.text = "0000\(totalScore)"
        }
        else if totalScore < 100{
            scoreLbl.text = "000\(totalScore)"
        }
        else if totalScore < 1000{
            scoreLbl.text = "00\(totalScore)"
        }
        else if totalScore < 10000{
            scoreLbl.text = "0\(totalScore)"
        }
        else {
            scoreLbl.text = "\(totalScore)"
        }
    }
    
    @IBAction func redBtn(_ sender: UIButton) {
        
        if time != 0{
            noClick += 1
            calculateTotalScore()
            displayScore()
            
            //resize button
            //sender.frame = CGRect(x: sender.frame.origin.x, y: sender.frame.origin.y, width: 140, height: 140)
            //set image yg baru
            //sender.setImage(UIImage(named: "redBtn.png"), for: .normal)
            
            if btnLevel == 1 {
                if totalScore > 14750 {
                    goToNextLevel(button: sender)
                }
                    
                else if totalScore > 13000{
                    sender.setImage(images[7], for: .normal)
                }
                    
                else if totalScore > 12000{
                    sender.setImage(images[6], for: .normal)
                }
                else if totalScore > 9500{
                    sender.setImage(images[5], for: .normal)
                }
                else if totalScore > 7800{
                    sender.setImage(images[4], for: .normal)
                }
                else if totalScore > 5600{
                    sender.setImage(images[3], for: .normal)
                }
                else if totalScore > 3800 {
                    sender.setImage(images[2], for: .normal)
                }
                else if totalScore > 2500 {
                    sender.setImage(images[1], for: .normal)
                }
                else if totalScore > 1800 {
                    sender.setImage(images[0], for: .normal)
                }
            }
            
            
            if btnLevel == 2 {
                if totalScore > 28600{
                    goToNextLevel(button: sender)
                    
                }
                else if totalScore > 27800{
                    sender.setImage(images[7], for: .normal)
                }
                else if totalScore > 26500{
                    sender.setImage(images[6], for: .normal)
                }
                else if totalScore > 24500{
                    sender.setImage(images[5], for: .normal)
                }
                else if totalScore > 23000{
                    sender.setImage(images[4], for: .normal)
                }
                else if totalScore > 20000{
                    sender.setImage(images[3], for: .normal)
                }
                
                else if totalScore > 16500{
                    sender.setImage(images[1], for: .normal)
                }
            }
            
            if btnLevel == 3
            {
                if totalScore > 46200{
                    timer.invalidate()
                    sender.isHidden = true
                    separateBtnLeft.isHidden = false
                    separateBtnRight.isHidden = false
                    separateButton()
                    UIView.animate(withDuration: 1, animations: {
                        self.separateBtnLeft.isHidden = true
                        self.separateBtnRight.isHidden = true
                        self.retry.isHidden = false
                        self.retry.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
                        })
                }
                else if totalScore > 43400{
                    sender.setImage(images[7], for: .normal)
                }
                else if totalScore > 39900{
                    sender.setImage(images[6], for: .normal)
                }
                else if totalScore > 37300{
                    sender.setImage(images[5], for: .normal)
                }
                else if totalScore > 35500{
                    sender.setImage(images[4], for: .normal)
                }
                else if totalScore > 32300{
                    sender.setImage(images[2], for: .normal)
                }
            }
            
        }
        else if time == 0{
            updateTimer()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        createImageArr(totalImg: 9)
        displayScore()
        
    }
    
    //go to next level
    func goToNextLevel(button: UIButton){
        time = 0
        button.isHidden = true
        separateBtnLeft.isHidden = false
        separateBtnRight.isHidden = false
        timer.invalidate()
        separateButton()
        changeButton(button: button)
        noClick = 0
        btnLevel += 1
    }
    
    //change button to smaller one
    func changeButton(button: UIButton){
        scaleButton(button: button)
        separateBtnLeft.isHidden = true
        separateBtnRight.isHidden = true
        button.setImage(UIImage(named: "redBtn"), for: .normal)
        button.isHidden = false
        button.isEnabled = true
        rangeTime -= 15
        time = rangeTime
        timerLbl.text = "0      \(time)"
        startTimer()
    }
    
    
    //animate button
    func separateButton(){
        if btnLevel == 1 {
            separateBtnLeft.frame = CGRect(x: 112, y: 402, width: 190, height: 190)
            separateBtnRight.frame = CGRect(x: 206, y: 402, width: 190, height: 190)
        }
        else if btnLevel == 2 {
            separateBtnLeft.frame = CGRect(x: 137, y: 427, width: 140, height: 140)
            separateBtnRight.frame = CGRect(x: 137, y: 427, width: 140, height: 140)
        }
        else{
            separateBtnLeft.frame = CGRect(x: 147, y: 437, width: 120, height: 120)
            separateBtnRight.frame = CGRect(x: 147, y: 437, width: 120, height: 120)
        }
        
        
        
        UIImageView.animate(withDuration: 2, animations: {
            if self.btnLevel == 3 {
                self.separateBtnLeft.frame.origin.x -= 220
                self.separateBtnRight.frame.origin.x += 230
            }
            else {
                self.separateBtnLeft.frame.origin.x -= 220
                self.separateBtnRight.frame.origin.x += 150
            }
        }) { (true) in
            
        }
    }
    
    func scaleButton(button: UIButton){
        button.isHidden = false
        if btnLevel == 0 {
            button.frame = CGRect(x: 112, y: 402, width: 190, height: 190)
        }
        else if btnLevel == 1 {
            button.frame = CGRect(x: 137, y: 427, width: 140, height: 140)
        }
        else if btnLevel == 2 {
            button.frame = CGRect(x: 147, y: 437, width: 120, height: 120)
        }
        
    }

    
    //timer
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func resetTimer(){
        timer.invalidate()
    }
    
    @objc func updateTimer(){
        if time > 0 {
            time -= 1
            if time < 10 {
                timerLbl.text = "0      0\(time)"
            }
            else{
                timerLbl.text = "0      \(time)"
            }
        }
        else{
            timerLbl.text = "0      00"
            resetTimer()
        }
    }
    
    
}
