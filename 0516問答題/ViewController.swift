//
//  ViewController.swift
//  0516問答題
//
//  Created by 黃芳致 on 2020/5/19.
//  Copyright © 2020年 黃郁方. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var index = 0
    var score = 0
    var rightAnswer = ""
    
    var questionsInfoemation = [Qnas(question: "最聰明的恐龍？", option:  ["傷齒龍","暴龍","翼手龍"], answer: "傷齒龍"),
    Qnas(question: "最笨的恐龍？", option: ["傷齒龍","暴龍","劍龍"], answer: "劍龍"),Qnas(question: "最兇猛的恐龍是？", option: ["傷齒龍","暴龍","翼手龍"], answer: "暴龍"),Qnas(question: "最高的恐龍是？", option:  ["傷齒龍","劍龍","波塞東龍"], answer: "波塞東龍"),Qnas(question: "最大的恐龍是？", option: ["阿根廷龍","暴龍","翼手龍"], answer: "阿根廷龍"),Qnas(question: "第一個發現會挖洞的恐龍？", option:  ["傷齒龍","奔掘龍","翼手龍"], answer: "奔掘龍"),Qnas(question: "第一個發現有毒牙的恐龍？", option: ["中國鳥龍","暴龍","翼手龍"], answer: "中國鳥龍"),Qnas(question: "會照顧寶寶的龍？", option: ["傷齒龍","暴龍","慈母龍"], answer: "慈母龍")]
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var QLabel: UILabel!  //問題

    @IBOutlet weak var countLabel: UILabel!  //第幾題

 
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var optionButton: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(0)"
        countLabel.text = String(index+1)
        questionsInfoemation.shuffle()
        playGame()}
    func playGame(){
        QLabel.text = questionsInfoemation[index].question
        rightAnswer = questionsInfoemation[index].answer
        questionsInfoemation[index].option.shuffle()
  for i in 0...2{
             optionButton[i].setTitle(questionsInfoemation[index].option[i], for: UIControl.State.normal)
        }
}


    
    @IBAction func optionPressBtn(_ sender: UIButton) {
        index = index+1
        if sender.currentTitle == rightAnswer{
            score = score+10
            scoreLabel.text = "\(score)"
        }
            if index == questionsInfoemation.count{
            //生出一個alert
            let alertController = UIAlertController(
            title: "遊戲結束",
            message: "獲得: \(score)分",
            preferredStyle: .alert)
            //參數 preferredStyle 傳入 .alert 將顯示中間彈出視窗
            //利用 UIAlertAction 生成視窗上顯示的按鈕
            let okButton = UIAlertAction(
            title: "確定",
            style: .default
            )
            //利用 addAction 加入按鈕。若呼叫多次 addAction，即可加入多個按鈕。
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
            }else{
            countLabel.text = "\(index+1)"
                
            playGame()
            }}
        
    
        
        
    @IBAction func restartBn(_ sender: UIButton) {index = 0
        score = 0
        countLabel.text = "\(index+1)"
        scoreLabel.text = "\(0)"
        questionsInfoemation.shuffle()
        playGame()
    }
}


