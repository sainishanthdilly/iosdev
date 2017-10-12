//
//  CalculatorBrain.swift
//  calculator
//
//  Created by Sai Nishanth Dilly on 9/8/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import Foundation


func changeSign( operand: Double)->Double{
    
    return -operand
}
func multiply (op1 : Double, op2: Double) -> Double{
    return op1*op2
}

func add (op1 : Double, op2: Double) -> Double{
    return op1+op2
}


struct CalculatorBrain{
    
    private struct pendingBinaryOperation{
        
        let function:(Double,Double) -> Double
        let firstOperand : Double
        func perform(with secondOperand: Double) -> Double{
            return function(firstOperand,secondOperand)
        }
        
    }
    
    
    private var pendingBoper : pendingBinaryOperation?
    
    
    private var accumlator: Double?
    
    private enum Operation{
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var operations : Dictionary<String,Operation> =
        [
    "π" : Operation.constant(Double.pi),
    "e"  : Operation.constant(M_E),
    "√" : Operation.unaryOperation(sqrt),
    "cos": Operation.unaryOperation(cos),
    "±" : Operation.unaryOperation(changeSign),
    "*" : Operation.binaryOperation(multiply),
    "-" : Operation.binaryOperation({(op1, op2) in op1 - op2}),
    "+" : Operation.binaryOperation(add),
    "/" : Operation.binaryOperation({$0 / $1}),
    
    "=" : Operation.equals

    ]
    
    mutating func performOperation(_ symbol : String){
        
        if let operation = operations[symbol]{

            switch operation {
            case .constant(let associatedConstantValue):
                accumlator = associatedConstantValue
                    break
            case .unaryOperation(let function ):
                if accumlator != nil {
                    accumlator = function(accumlator!)
                }
                    break
            
            case .binaryOperation(let function):
                if accumlator != nil{
                    
                    pendingBoper = pendingBinaryOperation(function: function,firstOperand: accumlator!)
                    
                }
             break
            
            case .equals:
                performPendingBinaryOperation()
                
            }
            
            
            
        }
        
        
    }
    private mutating  func performPendingBinaryOperation(){
        if pendingBoper != nil && accumlator != nil{
            
           accumlator = pendingBoper!.perform(with: accumlator!)
            pendingBoper = nil
            
        }
    }
    
    mutating func setOperand(_ operand : Double){
        
        accumlator = operand
    }
    
    var result : Double?{
        get{
            return accumlator
        }
    }
    
}
