//
//  ViewController.swift
//  SwiftTest
//
//  Created by FlyElephant on 2019/4/9.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

import UIKit

//struct Resolution {
//    var width = 0
//    var height = 0
//}
//
//class VideoMode {
//    var resolution = Resolution()
//    var interlaced = false
//    var frameRate = 0.0
//    var name: String?
//}
//
//typealias success = (_ data: String) -> Void
//typealias fail = (_ error: String) -> Void
//
//func fetchData(_ url: String, success: success, fail: fail) {
//}
//
//protocol NetworkRequest {
//    associatedtype DataType
//    func didReceiveData(_ data: DataType)
//}
//
//class ViewModel: NetworkRequest {
//
//    typealias DataType = String
//
//    func didReceiveData(_ data: DataType) {
//
//    }
//
//}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testForInteration1()
    }
    
    func test() {
//        let someResolution = Resolution()
//        let someVideoMode = VideoMode()
//        someVideoMode.resolution.width = 1280
//        print("The width of someResolution is \(someResolution.width)")
//        print("The width of someVideoMode is \(someVideoMode.resolution.width)")
    }
    
    func testForInteration() {
        let arr: [String] = ["Fly","Elephant","FlyElephant"]
        for item in arr {
            print("\(item)")
        }
        arr.forEach { (item) in
            print("\(item)")
        }
    }
    
    func testForInteration1() {
        let arr: [String] = ["Fly","Elephant","FlyElephant"]
        arr.forEach { (item) in
            if item == "FlyElephant" {
                return
            }
            print("\(item)")
        }
        print("foreach end")
        for item in arr {
            if item == "FlyElephant" {
                return
            }
            print("\(item)")
        }
        print("for in end")
    }
    
    func mapReduce() {
//        let results = [[5,2,7], [4,8], [9,1,3]]
//        let allResults = results.flatMap { $0 }
//        print("\(allResults)")
        
        let names: [String?] = ["Tom", nil, "Peter", nil, "Harry"]
        let valid = names.flatMap { $0 }
    }


}

