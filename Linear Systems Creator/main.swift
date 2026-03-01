//
//  main.swift
//  Linear Systems Creator
//
//  Created on 2026-02-28.
//

import Foundation

var questionNum = 1
let numOfQuestions = 10

print("There ARE \(numOfQuestions) questions(press enter to go to the next question)")

for i in 0..<(numOfQuestions) {
    CreateLinearSystem()
}


func  CreateLinearSystem() {

    
    
    
    
    //MARK: Creating equations
    //Here I am declaring the equation dictonary
    ///The dictronary for an equation.
    var equation: [String:Decimal] = ["xCof1": 0, "xCof2": 1, "x": 0, "yCof1": 0, "yCof2": 1, "y": 0, "equalsTo": 0]
    var equation2: [String:Decimal] = ["xCof1": 0, "xCof2": 1, "x": 0, "yCof1": 0, "yCof2": 1, "y": 0, "equalsTo": 0]
    //the Cof2's are set to one so there is less code
    
    // creating the first cofs
    
    let places: Int = 0
    let step = pow(10.0, Double(places))
    let actualHigherLimit: Int = 10
    let higherLimit: Int = actualHigherLimit * Int(step)
    
    
    
    equation["xCof1"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
    equation["yCof1"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
    equation2["xCof1"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
    equation2["yCof1"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
    
    //creating x&y
    equation["x"] = Decimal(Int.random(in: -higherLimit...higherLimit))
    equation["y"] = Decimal(Int.random(in: -higherLimit...higherLimit))
    equation2["x"] = equation["x"]
    equation2["y"] = equation["y"]
    
    //looking to see the the equation will have fractions of not
    let equationHasFractions = Bool.random()
    
    
    if equationHasFractions == false {
        
       
        
        //creating the coefficients of x and y in both equations
        
     
        
        //finding out hte answer
        
        let newX: Decimal = equation["xCof1"]!  * equation["x"]!
        let newY: Decimal = equation["yCof1"]! * equation["y"]!
        let newX2: Decimal = equation2["xCof1"]! * equation2["x"]!
        let newY2: Decimal = equation2["yCof1"]!  * equation2["y"]!
        
        equation["equalsTo"] = newX + newY
        equation2["equalsTo"] = newX2 + newY2
        
    } else {
        
        //creating the coefficients of x and y in both equations
        
        equation["xCof2"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
        equation["yCof2"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
        equation2["xCof2"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
        equation2["yCof2"] = Decimal(Int.random(in: -higherLimit...higherLimit)) / Decimal(step)
        
        
        
        //finding out hte answer
        
        let actualXCof1: Decimal = equation["xCof1"]!  / equation["xCof2"]!
        let actualYCof1: Decimal = equation["yCof1"]! / equation["yCof2"]!
        let actualXCof2: Decimal = equation2["xCof1"]! / equation2["xCof2"]!
        let actualYCof2: Decimal = equation2["yCof1"]! / equation2["yCof2"]!
        
        let newX: Decimal = actualXCof1 * equation["x"]!
        let newY: Decimal = actualYCof1 * equation["y"]!
        let newX2: Decimal = actualXCof2 * equation2["x"]!
        let newY2: Decimal = actualYCof2 * equation2["y"]!
        
        equation["equalsTo"] = newX + newY
        equation2["equalsTo"] = newX2 + newY2
        
        
    }
    
    //MARK: VIEWING EQUATION
    
    var equationViewed: String = ""
    var equation2Viewed: String = ""
    
    if equationHasFractions == false {
        
        if equation["yCof1"]! > 0 {
            equationViewed = "\(equation["xCof1"], default: "NIL ")x + \(equation["yCof1"], default: "NIL ")y = \(equation["equalsTo"], default: "NIL ")"
        } else {
            equationViewed = "\(equation["xCof1"], default: "NIL ")x - \(equation["yCof1"]! * -1)y = \(equation["equalsTo"], default: "NIL ")"
        }
       
        if equation2["yCof1"]! > 0 {
            equation2Viewed = "\(equation2["xCof1"], default: "NIL ")x + \(equation2["yCof1"], default: "NIL ")y = \(equation2["equalsTo"], default: "NIL ")"
            
        } else {
            equation2Viewed = "\(equation2["xCof1"], default: "NIL ")x - \(equation2["yCof1"]! * -1)y = \(equation2["equalsTo"], default: "NIL ")"
            
        }
        
       
        
    } else {//fractions
        
        
            equationViewed = "(\(equation["xCof1"], default: "NIL1 ") ÷ \(equation["xCof2"], default: "NIL2 "))x + (\(equation["yCof1"], default: "NIL1 ") ÷ \(equation["yCof2"], default: "NIL2 "))y = \(equation["equalsTo"], default: "NIL ")"
        equation2Viewed = "(\(equation2["xCof1"], default: "NIL1 ") ÷ \(equation2["xCof2"], default: "NIL2 "))x + (\(equation2["yCof1"], default: "NIL1 ") ÷ \(equation2["yCof2"], default: "NIL2 "))y = \(equation2["equalsTo"], default: "NIL ")"
        
        
    }
    
    print("⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️⬜️")
    print("Question \(questionNum)")
    print("There are other types of linear systems so don't only study these questions like them. ")
    print("🚩ROUND TO  \(1 / step) for floating point errors. 🚩")
    print(" ")
    print("Solve for x and y in this system:")
    print(" First equation: \(equationViewed)")
    print(" Second equation: \(equation2Viewed)")
    print("say anything to get the answers")
    //print("look at desmos for answers")
    
    readLine()! // remove this and change the answeres thing then use https://swiftfiddle.com/ when you don't have xcode.
    questionNum += 1
    
    print(" ")
    print("X is \(equation["x"]!), and Y is \(equation["y"]!)\n")
    // accurate (verified trhough desmos)
    
    
}
