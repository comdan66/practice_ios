//
//  ViewController.swift
//  0214
//
//  Created by OA Wu on 2015/2/14.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textField: UITextField!
    var button: UIButton!
    
    func buttonIsPressed(sender: UIButton){
        sender.enabled = false;
        println("Button is pressed.")
    }
    
    func buttonIsTapped(sender: UIButton){
        println("Button is tapped.")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var params = Dictionary<String, Any>()
        params = [
            "account": "oa",
            "password": "xxx123"]

        var api = Api();
        api.post("http://zeus.ioa.tw/", params: params, {() in
            println("callback")
        });
        
        textField = UITextField(frame: CGRect(x: CGRectGetMidX(self.view.frame) - 110, y: 35, width: 220, height: 30))
        
        textField.borderStyle = .RoundedRect
        textField.secureTextEntry = true
        textField.contentVerticalAlignment = .Center
        textField.textAlignment = .Left
        textField.placeholder = "Enter your text here..."
        
        let currencyLabel = UILabel(frame: CGRectZero)
        currencyLabel.text = "帳號:"
        currencyLabel.font = textField.font
        currencyLabel.textAlignment = .Right
        currencyLabel.sizeToFit()

        currencyLabel.frame.size.width += 10
        textField.leftView = currencyLabel
        textField.leftViewMode = .Always
        
        view.addSubview(textField)
        
        let normalImage = UIImage(named: "NormalBlueButton")
        let highlightedImage = UIImage(named: "HighlightedBlueButton")
        
        button = UIButton.buttonWithType(.Custom) as? UIButton
        button.frame = CGRect(x: CGRectGetMidX(self.view.frame) - 50, y: 70, width: 100, height: 44)
        
        button.setTitle("登入", forState: .Normal)
        button.setTitle("登入", forState: .Highlighted)
        button.setTitle("登入中..", forState: .Disabled)
        
        button.setBackgroundImage(normalImage, forState: .Normal)
        button.setBackgroundImage(highlightedImage, forState: .Highlighted)
        
        button.addTarget(
            self,
            action: "buttonIsPressed:",
            forControlEvents: .TouchDown)
        
        button.addTarget(
            self,
            action: "buttonIsTapped:",
            forControlEvents: .TouchUpInside)
        
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

