

//
//  ViewController.swift
//  AutoLayOut
//
//  Created by MDL on 6/12/18.
//  Copyright © 2018 fit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var label_3: UILabel!
    @IBOutlet weak var label_4: UILabel!
    @IBOutlet weak var label_5: UILabel!
    
    static var uName : String = ""
    static var pWord : String = ""
    
    @IBAction func submit(_ sender: Any) {
        ViewController.uName = userName.text!
        ViewController.pWord = password.text!
     // APIManager.shared.fetchAPIData()
     //   APIManager.shared.fetchData()
        APIManager.shared.fecthDataFromAPI2()
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

