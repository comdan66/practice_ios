//
//  ViewController.swift
//  0214
//
//  Created by OA Wu on 2015/2/14.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var accountTextField: UITextField!
    var passwordTextField: UITextField!
    
    func buttonIsTapped(sender: UIButton){
        var alertView = UIAlertView();
        alertView.message = "Loadding";
        alertView.show();


        var params = Dictionary<String, Any>()
        params = [
            "account": "oa",
            "password": "xxx123"]

        var api = Api();

        api.post("http://zeus.ioa.tw/", params: params, {() in
        
            alertView.dismissWithClickedButtonIndex(-1, animated: true);
            
            let operationQueue: NSOperationQueue = NSOperationQueue.mainQueue()
            operationQueue.addOperationWithBlock({ () -> Void in
                var okAlertView = UIAlertView();
                okAlertView.message = "OK";
                okAlertView.show();
                
                println("callback")
            })
        });
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        accountTextField = UITextField(frame: CGRect(x: CGRectGetMidX(self.view.frame) - 110, y: 85, width: 220, height: 30))
        accountTextField.borderStyle = .RoundedRect
        accountTextField.contentVerticalAlignment = .Center
        accountTextField.textAlignment = .Left
        accountTextField.placeholder = "請輸入帳號.."
        view.addSubview(accountTextField)
        
        
        passwordTextField = UITextField(frame: CGRect(x: CGRectGetMidX(self.view.frame) - 110, y: 130, width: 220, height: 30))
        passwordTextField.borderStyle = .RoundedRect
        passwordTextField.secureTextEntry = true
        passwordTextField.contentVerticalAlignment = .Center
        passwordTextField.textAlignment = .Left
        passwordTextField.placeholder = "請輸入密碼.."
        view.addSubview(passwordTextField)
        
        
        let normalImage = UIImage(named: "NormalBlueButton")
        let highlightedImage = UIImage(named: "HighlightedBlueButton")

        var button: UIButton!
        button = UIButton.buttonWithType(.Custom) as? UIButton
        button.frame = CGRect(x: CGRectGetMidX(self.view.frame) - 50, y: 270, width: 100, height: 44)
        
        button.setTitle("登入", forState: .Normal)
        button.setTitle("登入", forState: .Highlighted)
        button.setTitle("登入中..", forState: .Disabled)
        
        button.setBackgroundImage(normalImage, forState: .Normal)
        button.setBackgroundImage(highlightedImage, forState: .Highlighted)
        
//        button.addTarget(
//            self,
//            action: "buttonIsPressed:",
//            forControlEvents: .TouchDown)
        
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

