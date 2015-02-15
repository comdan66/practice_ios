//
//  Api.swift
//  0214
//
//  Created by OA Wu on 2015/2/15.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

import Foundation

class Api {
    func dataFromHttpParameters(params: Dictionary<String, Any>) -> NSData? {
        var parameterArray = [String]()
        
        for (key, value) in params {
            parameterArray.append("\(key)=\(value)")
        }
        
        let parameterString = join("&", parameterArray) as NSString
        return parameterString.dataUsingEncoding(NSUTF8StringEncoding)
    }
    
    func post (url: String, params: Dictionary<String, Any>, callback: () -> Void) {
        
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "POST"
        
        request.HTTPBody = dataFromHttpParameters (params);
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary
            
            println(jsonResult)
            
            if (jsonResult != nil) {
                callback();
                // process jsonResult
            } else {
                // couldn't load JSON, look at error
            }
        })
    }
}
