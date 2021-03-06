//
//  GrammarChecker.swift
//  CoordinateCalculator
//
//  Created by 김수현 on 2018. 1. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct GrammarChecker {

    let validCharacter = CharacterSet.init(charactersIn: "(),-").union(CharacterSet.decimalDigits)

    func isVaildInput(_ input: String) -> Bool {
        let check = input.components(separatedBy: validCharacter).filter{ $0 != "" }
        if check.count == 0 { return true }
        return false
    }

    private func checkUnderNumber(_ point: MyPoint) -> Bool {
        return point.x <= 24 && point.y <= 24
    }

    func isUnderNumber(_ value: [MyPoint]) -> Bool {
        var maxValue: Bool = true
        for index in 0..<value.count {
            guard checkUnderNumber(value[index]) != false else{ maxValue = false; return false }
        }
        guard maxValue == true else { return false }
        return true
    }

    func checkRect(_ myShape: MyShape) -> Bool {
        let point = myShape.drawPoint()
        if point.count == 4 {
            let rect = MyRect.init(point)
            guard rect.isRectangle() == true else {
                print("직사각형만 입력 가능합니다. 다시 입력해주세요")
                return false
            }
        }
        return true
    }

}
