//
//  CustomView.swift
//  扇形
//
//  Created by zcy on 2016/11/4.
//  Copyright © 2016年 CY. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /// 半圆的中心点位置，X
    var centerX: Float = 0.0
    /// 半圆的中心位置，Y
    var centerY: Float = 0.0
    /// 半圆的半径
    var radius: Float = 0.0
    var sunImgView = UIImageView()
    var sunRiseLab = UILabel()
    var sunSetLab = UILabel()
    var currentAngle: Float = 0.0
    

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context: CGContext = UIGraphicsGetCurrentContext()!
        var color: UIColor = UIColor.orange

        context.setLineWidth(0.5)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setLineDash(phase: 0.0, lengths: [2.0,0.5])
        
        color = UIColor.clear
        context.setFillColor(color.cgColor)
        let centerPoint = CGPoint(x: CGFloat(self.centerX), y: CGFloat(self.centerY))
        context.move(to: centerPoint)
        context.addArc(center: centerPoint, radius: CGFloat(self.radius), startAngle: CGFloat(0*M_PI/180), endAngle: CGFloat(180*M_PI/180), clockwise: true)
        context.closePath()
        context.drawPath(using: .fillStroke)
        
        let sin = fabsf(sinf((180 + self.currentAngle) * Float(M_PI) / 180))
        let cos = fabsf(cosf((180 + self.currentAngle) * Float(M_PI) / 180))
        var sunCenterX: Float! = 0.0
        var sunCenterY: Float! = 0.0

        if self.currentAngle < 90 {
            sunCenterX = self.centerX - cos * self.radius;
            sunCenterY = self.centerY - sin * self.radius;

        }else if self.currentAngle > 90 {
            sunCenterX = self.centerX + cos * self.radius;
            sunCenterY = self.centerY - sin * self.radius;
        }
        
        sunImgView.center = CGPoint(x: CGFloat(sunCenterX), y: CGFloat(sunCenterY))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let pointView_left = UIView(frame: .init(x: 50-7.5, y: self.bounds.size.width/2-40-7.5, width: 15, height: 15))
        pointView_left.backgroundColor = UIColor.white
        pointView_left.layer.cornerRadius = 7.5
        self.addSubview(pointView_left)
        
        let pointView_right = UIView(frame: .init(x: self.frame.size.width-50-7.5, y: self.bounds.size.width/2-40-7.5, width: 15, height: 15))
        pointView_right.backgroundColor = UIColor.white
        pointView_right.layer.cornerRadius = 7.5
        self.addSubview(pointView_right)
        
        let lineView = UIView(frame: .init(x: 20, y: self.bounds.size.width/2-40, width: self.frame.size.width-40, height: 1))
        lineView.backgroundColor = UIColor.white;
        self.addSubview(lineView)
        self.sunImgView.frame = CGRect.init(x: 50-7.5, y: self.frame.size.width/2-40-7.5, width: 15, height: 15)
        self.sunImgView.backgroundColor = UIColor.yellow
        self.addSubview(sunImgView)
        
        self.sunRiseLab.frame =  CGRect.init(x: 32, y: self.frame.size.width/2-25, width: 100, height: 13)
        self.sunRiseLab.font = UIFont.systemFont(ofSize: 13)
        self.sunRiseLab.textColor = UIColor.white
        self.addSubview(sunRiseLab)
        
        self.sunSetLab.frame = CGRect.init(x: self.frame.size.width-134, y: self.frame.size.width/2-25, width: 100, height: 13)
        self.sunSetLab.font = UIFont.systemFont(ofSize: 13)
        self.sunSetLab.textColor = UIColor.white
        self.sunSetLab.textAlignment = .right
        self.addSubview(sunSetLab)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
