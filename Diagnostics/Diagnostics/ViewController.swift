//
//  ViewController.swift
//  Diagnostics
//
//  Created by Youssra Outelli on 3/18/20.
//  Copyright © 2020 Youssra Outelli. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
    }
    
    
    @IBAction func generateReport(_ sender: UIButton) {
        print("Model:", UIDevice.current.modelName)
        print("System version:", UIDevice.current.systemVersion)
        
        if let appName = Bundle.main.appName {
            print("Name of app:", appName)
        }
        
        if let appVersion = UIApplication.appVersion {
            print("App version:", appVersion)
        }
        
    }
    
    
   


}

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}

extension Bundle {
    var appName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String ??
               object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}



extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        return machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
//        switch identifier {
//        //iPhone
//        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
//        case "iPhone7,2":                               return "iPhone 6"
//        case "iPhone7,1":                               return "iPhone 6 Plus"
//        case "iPhone8,1":                               return "iPhone 6s"
//        case "iPhone8,2":                               return "iPhone 6s Plus"
//        case "iPhone8,4":                               return "iPhone SE"
//        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
//        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
//        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
//        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
//        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
//        case "iPhone11,8":                              return "iPhone XR"
//        case "iPhone11,2":                              return "iPhone XS"
//        case "iPhone11,6":                              return "iPhone XS Max"
//        case "iPhone12,1":                              return "iPhone 11"
//        case "iPhone12,3":                              return "iPhone 11 Pro"
//        case "iPhone12,5":                              return "iPhone 11 Pro Max"
//
//
//        //iPad
//        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
//        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
//        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
//        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
//        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
//        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
//
//
//        //iPod
//        case "iPod7,1":                                  return "iPod touch (6th generation)"
//        case "iPod9,1":                                  return "iPod touch (7th generation)"
//
//
//        //Apple TV
//        case "AppleTV2,1":                              return "Apple TV (2nd generation)"
//        case "AppleTV3,1", "AppleTV3,2":                return "Apple TV (3rd generation)"
//        case "AppleTV5,2":                              return "Apple TV (4th generation)"
//        case "AppleTV6,2":                              return "Apple TV 4K"
//
//
//        case "i386", "x86_64":                          return "Simulator"
//        default:                                        return identifier
//        }
    }
}
