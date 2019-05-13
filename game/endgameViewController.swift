//
//  endgameViewController.swift
//  game
//
//  Created by EA on 2019/5/13.
//  Copyright © 2019 EA. All rights reserved.
//

import UIKit

class endgameViewController: UIViewController {

    @IBOutlet weak var whowin: UITextField!
    
    @IBOutlet weak var restart: UIButton!
    var receivedInt :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print(receivedInt)
       checkend(receivedInt: receivedInt)
        // Do any additional setup after loading the view.
    }
    
    func checkend(receivedInt: Int)
    {
        if(receivedInt == 1)
        {
            whowin.text = "你是老大"
            restart.setTitle("再當一次", for: .normal)
        }
        else if(receivedInt == 0)
        {
            whowin.text = "下去吧菜雞"
            restart.setTitle("東山再起", for: .normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
