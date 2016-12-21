//
//  ViewController.swift
//  扇形
//
//  Created by zcy on 2016/11/4.
//  Copyright © 2016年 CY. All rights reserved.
//

import UIKit
//import CustomView

class ViewController: UIViewController {

    var timer = Timer()
    var view1 = CustomView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        let mainWidth = Float(self.view.frame.width)
        let mainView = UIView()
        mainView.frame = CGRect(x: 20, y: 100, width: Int(mainWidth)-40, height: Int(mainWidth/2)+15)

        mainView.backgroundColor = UIColor.red
        mainView.layer.cornerRadius = 4
        mainView.layer.borderColor = UIColor.orange.cgColor
        mainView.layer.borderWidth = 1
        self.view.addSubview(mainView)
        
        view1 = CustomView(frame: CGRect(x: 0, y: 120, width: Int(mainWidth), height: Int(mainWidth/2)))
        view1.backgroundColor = UIColor.clear
        view1.centerX = mainWidth/2
        view1.centerY = mainWidth/2 - 40
        view1.radius = mainWidth/2 - 50
        view1.sunRiseLab.text = "06:17"
        view1.sunSetLab.text = "17:47"
        self.view.addSubview(view1)
        
        let button1 = UIButton(type: .system)
        button1.setTitle("开始", for: .normal)
        button1.frame = CGRect(x: 100, y: 400, width: 100, height: 20)
        button1.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        self.view.addSubview(button1)
        
        let button2 = UIButton(type: .system)
        button2.frame = CGRect(x: 100, y: 500, width: 100, height: 30)
        button2.setTitle("清除", for: .normal)
        button2.addTarget(self, action: #selector(cancelClick), for: .touchUpInside)
        self.view.addSubview(button2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnClick() {
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(draw), userInfo: nil, repeats: true)
    }
    
    func cancelClick() {
        view1.currentAngle = 0.0
        view1.setNeedsDisplay()
    }

    func draw() {
        view1.currentAngle += 0.1
        if view1.currentAngle > 180 {
            timer.invalidate()
            return
        }
        view1.setNeedsDisplay()
    }
}

