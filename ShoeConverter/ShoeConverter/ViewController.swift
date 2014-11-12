//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Javlon Usmanov on 9/16/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menShoeSizeTextField: UITextField!
    @IBOutlet var convertedNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertButton(sender: UIButton) {
        let shoeSize = menShoeSizeTextField.text
        let numberFromTextField = shoeSize.toInt()
        var intFromTextField:Int = numberFromTextField!
        let conversionNumber:Int = 30
        intFromTextField += conversionNumber
        convertedNumber.hidden = false
        let stringConverted = "\(intFromTextField)"
        convertedNumber.text = stringConverted
        
    }

}

