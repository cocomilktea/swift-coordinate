//
//  File.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 15..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct MyLine: MyShape, MyCalculate, Equatable {
    
    static func ==(lhs: MyLine, rhs: MyLine) -> Bool {
        return lhs.pointA.x == rhs.pointA.x && lhs.pointA.y == rhs.pointA.y && lhs.pointB.x == rhs.pointB.x && lhs.pointB.y == rhs.pointB.y
    }
    
    var pointA = MyPoint(x: 0, y: 0)
    var pointB = MyPoint(x: 0, y: 0)
    
    init(pointA: MyPoint, pointB: MyPoint){
        self.pointA = pointA
        self.pointB = pointB
    }
    
    init(_ coordinates: [MyPoint]) {
        self.pointA = coordinates[0]
        self.pointB = coordinates[1]
    }
    
    func calculate() -> (String, Double) {
        let x = Double(self.pointA.x - self.pointB.x)
        let y = Double(self.pointA.y - self.pointB.y)
        let distance = sqrt(Double(pow(x, 2) + Double(pow(y, 2))))
        return ("두 점 사이의 거리는 ", distance)
    }
    
    func drawPoint() -> [MyPoint] {
        return [self.pointA, self.pointB]
    }
    
}

