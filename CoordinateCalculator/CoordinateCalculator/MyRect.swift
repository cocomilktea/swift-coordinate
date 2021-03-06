//
//  MyRect.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyRect: MyShape, MyCalculate, Equatable {
    
    static func ==(lhs: MyRect, rhs: MyRect) -> Bool {
        return lhs.leftTop.x == rhs.leftTop.x && lhs.leftTop.y == rhs.leftTop.y && lhs.rightBottom.x == rhs.rightBottom.x && lhs.rightBottom.y == rhs.rightBottom.y && lhs.rightTop.x == rhs.rightTop.x && lhs.rightTop.y == rhs.rightTop.y &&
            lhs.leftBottom.x == rhs.leftBottom.x && lhs.leftBottom.y == rhs.leftBottom.y
    }
    
    var leftTop = MyPoint(x: 0, y: 0)
    var rightBottom = MyPoint(x: 0, y: 0)
    var rightTop = MyPoint(x: 0, y: 0)
    var leftBottom = MyPoint(x: 0, y: 0)
    
    init(origin: MyPoint, size: CGSize) {
        self.leftTop = origin
        self.rightBottom = MyPoint(x: origin.x + Int(size.width), y: origin.y + Int(size.height))
        self.rightTop = MyPoint(x: self.rightBottom.x, y: self.leftTop.y)
        self.leftBottom = MyPoint(x: self.leftTop.x, y: self.rightBottom.y)
    }
    
    init(_ points: [MyPoint]) {
        self.leftTop = points[0]
        self.rightTop = points[1]
        self.leftBottom = points[2]
        self.rightBottom = points[3]
    }
    
    func calculate() -> (String, Double) {
        let area = Double((self.leftTop.x-self.rightTop.x) * (self.leftTop.y-self.leftBottom.y))
        return ("사각형 넓이는 ", area)
    }
    
    func isRectangle() -> Bool {
        if self.leftTop.x != self.rightBottom.x && self.rightTop.x != self.leftBottom.x {
            return false
        }
        if self.leftTop.y != self.rightTop.y && self.rightBottom.y != self.leftBottom.y {
            return false
        }
        return true
    }
    
    func drawPoint() -> [MyPoint] {
        return [leftTop, rightTop,leftBottom, rightBottom]
    }
    
}

