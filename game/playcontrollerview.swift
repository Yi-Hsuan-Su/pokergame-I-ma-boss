//
//  playcontrollerviewViewController.swift
//  game
//
//  Created by EA on 2019/5/9.
//  Copyright © 2019 EA. All rights reserved.
//

import UIKit
import AVFoundation

class playcontrollerview: UIViewController {
    
    @IBOutlet weak var timerlabel: UILabel!
    
    
    @IBOutlet weak var buttons: UIButton!
    
    
    @IBOutlet weak var btn2: UIButton!
    var isopen = true
    var counter = 10.00
    var timer = Timer()
    var ascore = 0
    var pscore = 0
    var poker :Poker!
    var bgmusic = AVAudioPlayer()
    
    @IBOutlet weak var playerscore: UITextField!
    @IBOutlet weak var aiscore: UITextField!
    @IBOutlet weak var playercf: UITextField!
    @IBOutlet weak var aicf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        playerscore.text = String(pscore)
        aiscore.text = String(ascore)
        timerlabel.text = String(counter)
        poker = Poker()
        playmusic()
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    
    @objc func UpdateTimer() {
        counter = counter - 0.1
        timerlabel.text = String(format: "%.1f", counter)
        if Float(counter) < 0.0{
            timerlabel.text = "0"
            let controller = UIAlertController(title: "遊戲結束", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler:{ action in self.performSegue(withIdentifier: "seague", sender: self)})
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
            timer.invalidate()
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seague" {
            let secondVC = segue.destination as! endgameViewController
            if(ascore > pscore) {secondVC.receivedInt = 0}
            else if(ascore < pscore){secondVC.receivedInt = 1}
            
        }
    }

    
    
    
    func playmusic()
    {
       let sound =	Bundle.main.path(forResource: "casinogod", ofType: "mp3")
        do{
        bgmusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch
        {
            print("error")
        }
    }
    
    
    @IBAction func actionfordraw(_ sender: UIButton) {
        if isopen
        {
            isopen = false
            let image = UIImage(named:"pokerback")
            btn2.setImage(image, for: .normal)
            buttons.setImage(image, for: .normal)
            let cardindexa = Int.random(in: 0...51)
            aicf.text = poker.cards[cardindexa].size + poker.cards[cardindexa].suit
           
            let cardindexp = Int.random(in: 0...51)
            playercf.text = poker.cards[cardindexp].size + poker.cards[cardindexp].suit
            
            if checksuit(poker: poker.cards[cardindexa].suit ) > checksuit(poker: poker.cards[cardindexp].suit){
                ascore = ascore+1
                aiscore.text = String(ascore)
            }
            else if checksuit(poker: poker.cards[cardindexa].suit ) < checksuit(poker: poker.cards[cardindexp].suit){
                pscore = pscore+1
                playerscore.text = String(pscore)
            }
            else if checksuit(poker: poker.cards[cardindexa].suit ) == checksuit(poker: poker.cards[cardindexp].suit){
                if checksize(poker: poker.cards[cardindexa].size) > checksize(poker:poker.cards[cardindexp].size)
                {
                    ascore = ascore+1
                    aiscore.text = String(ascore)
                }
                else if checksize(poker: poker.cards[cardindexa].size) < checksize(poker:poker.cards[cardindexp].size){
                    pscore = pscore+1
                    playerscore.text = String(pscore)
                    
                }
                else if checksize(poker:poker.cards[cardindexa].size) == checksize(poker:poker.cards[cardindexp].size){
                }
            }
            UIView.transition(with: btn2, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            UIView.transition(with: buttons, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        else
        {
         isopen =  true
        let image = UIImage(named:"bg_poker_front")
        btn2.setImage(image, for: .normal)
        buttons.setImage(image, for: .normal)

        aicf.text = ""
            
        playercf.text = ""
       UIView.transition(with: btn2, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
 
        UIView.transition(with: buttons, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
    
    
    func checksuit (poker: String)->Int
  	{
        if(poker == "♠️")
        {
            return 4
        }
        else if(poker == "♣️")
        {
            return 1
        }
        else if(poker == "♥️")
        {
            return 3
        }
        else if(poker == "♦️")
        {
            return 2
        }
        return 0
    }
    
    func checksize (poker: String)->Int
    {
        if(poker == "A")
        {
            return 14
        }
        else if(poker == "2")
        {
            return 15
        }
        else if(poker == "3")
        {
            return 3
        }
        else if(poker == "4")
        {
            return 4
        }
        else if(poker == "5")
        {
            return 5
        }
        else if(poker == "6")
        {
            return 6
        }
        else if(poker == "7")
        {
            return 7
        }
        else if(poker == "8")
        {
            return 8
        }
        else if(poker == "9")
        {
            return 9
        }
        else if(poker == "10")
        {
            return 10
        }
        else if(poker == "J")
        {
            return 11
        }
        else if(poker == "Q")
        {
            return 12
        }
        else if(poker == "K")
        {
            return 13
        }
        return 0
    }

}

