//
//  ViewController.swift
//  Dice Rolling
//
//  Created by 吳世馨 on 2020/12/21.
//

import UIKit
import GameplayKit
import AVFoundation


class ViewController: UIViewController {

//Outlet與Outlet Collection們
    @IBOutlet var leftDices: [UIImageView]!
    @IBOutlet var rightDices: [UIImageView]!
    @IBOutlet var allDices: [UIImageView]!
    @IBOutlet weak var leftDicesLabel: UILabel!
    @IBOutlet weak var rightDicesLabel: UILabel!
    @IBOutlet weak var sumDicesLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
 //定義常數與變數
    let images = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    var randomDistribution: GKRandomDistribution!
    var leftSum = 0
    var rightSum = 0
    var totalSum = 0

//設定分別轉動兩邊骰子的Button並加總
    @IBAction func dicesButtonPress(_ sender: UIButton) {
        switch sender {
        case leftButton:
            leftSum = 0
            for i in 0...2{
                ////透過randomDistribution產生隨機亂數，並顯示骰子圖案
                let number = randomDistribution.nextInt()
                let imageName = images[number-1]
                leftDices[i].image = UIImage(named: imageName)
                leftSum += number
            }
            leftDicesLabel.text = "\(leftSum)"
        case rightButton:
            rightSum = 0
            for i in 0...2{
                let number = randomDistribution.nextInt()
                let imageName = images[number-1]
                rightDices[i].image = UIImage(named:imageName)
                rightSum += number
            }
            rightDicesLabel.text = "\(rightSum)"
        default:
            break
        }
        totalSum = leftSum + rightSum
        sumDicesLabel.text = "\(totalSum)"
    }

//骰骰子時播放音效
    let player = AVPlayer()
    @IBAction func playSoundEffect (_ sender: Any){
        let soundEffectUrl = Bundle.main.url(forResource: "rollingdice", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: soundEffectUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }

//ViewDidLoad中定義random最大值為骰子數量
    override func viewDidLoad() {
        super.viewDidLoad()
        randomDistribution = GKRandomDistribution(lowestValue: 1, highestValue: images.count)
    }
  
//設定晃動骰子時產生的效果
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        for i in 0...5{
            let images = ["dice1","dice2","dice3","dice4","dice5","dice6"]
            let number = randomDistribution.nextInt()
            let _: GKRandomDistribution!
            var totalSum = 0
            let imageName = images[number-1]
            allDices[i].image = UIImage(named:imageName)
            totalSum += number
            sumDicesLabel.text = "\(totalSum)"
            
            let soundEffectUrl = Bundle.main.url(forResource: "rollingdice", withExtension: "mp3")!
            let playerItem = AVPlayerItem(url: soundEffectUrl)
            player.replaceCurrentItem(with: playerItem)
            player.play()
            
        }
        
    }
  
    }


