//
//  CheckingInput.swift
//  CoordinateCalculator
//
//  Created by YOUTH on 2017. 11. 17..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckingInput {
    
    enum ErrorCase: String, Error {
        case emptyInput = "좌표값을 반드시 입력해주세요."
        case wrongForm = "입력 형태는 (,)입니다."
        case overNumPoint = "좌표값은 24이하로 입력하세요."
        case lessNumPoint = "좌표값은 0이상으로 입력하세요."
    }
    
    func checkInputError (_ inputValue: String?) throws -> (Int, Int) {
        var userPointX = 0
        var userPointY = 0
        let userInput = inputValue ?? ""
        
        // 1. 사용자 입력이 공백일 경우 에러체크
        if userInput == "" {
            throw ErrorCase.emptyInput
        }
        
        // 2. 사용자 입력이 (,) 형태가 아닐경우 에러체크, 형태가 맞다면 사용자 좌표값 MyPoint 매칭
        if userInput.hasPrefix("(") && userInput.hasSuffix(")") {
            let noBlanks = userInput.trimmingCharacters(in: ["(", ")"])
            if noBlanks.contains(",") {
                var userPoints = noBlanks.split(separator: ",")
                userPointX = Int(userPoints[0])! //괄호 잘라줘야함
                userPointY = Int(userPoints[1])!
            } else {
                throw ErrorCase.wrongForm
            }
        } else {
            throw ErrorCase.wrongForm
        }
       
        // 3. 사용자 입력 좌표값이 24가 넘을경우 에러체크
        if userPointX >= 24 || userPointY >= 24 {
            throw ErrorCase.overNumPoint
        }
        
        // 4. 사용자 입력 좌표값이 0 이하일 경우 에러체크
        if userPointX <= 0 || userPointY <= 0 {
            throw ErrorCase.lessNumPoint
        }
        
        let pointValue = (x: userPointX, y: userPointY)
        return pointValue
    }
    
}