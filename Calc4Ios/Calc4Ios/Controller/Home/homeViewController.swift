//
//  homeViewController.swift
//  Calc4Ios
//
//  Created by Miguel Angel Fonseca Perez on 8/4/19.
//  Copyright © 2019 Miguel Angel Fonseca Perez. All rights reserved.
//

import UIKit

final class homeViewController: UIViewController{
 
 
    //MARK: -Outlets
    //result
    @IBOutlet weak var result: UILabel!
    //numbers
    @IBOutlet weak var number0:UIButton!
    @IBOutlet weak var number1:UIButton!
    @IBOutlet weak var number2:UIButton!
    @IBOutlet weak var number3:UIButton!
    @IBOutlet weak var number4:UIButton!
    @IBOutlet weak var number5:UIButton!
    @IBOutlet weak var number6:UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    //operators
    @IBOutlet weak var opAC: UIButton!
    @IBOutlet weak var opPlusMinus: UIButton!
    @IBOutlet weak var opPoint: UIButton!
    @IBOutlet weak var opMinus: UIButton!
    @IBOutlet weak var opPercentage: UIButton!
    @IBOutlet weak var opDivision: UIButton!
    @IBOutlet weak var opResult: UIButton!
    @IBOutlet weak var opMultiplication: UIButton!
    @IBOutlet weak var opPlus: UIButton!
    //MARK: -Variables
    private var total: Double = 0
    private var temp: Double = 0
    private var operating = false
    private var decimal = false
    private var operation: OperationType = .none
    //MARK:Constans
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLenght = 9
    private let kMaxValue:Double = 999999999
    private let kMinValue:Double = 0.00000001
    private enum OperationType{
        case none, substraccion, addiction, multiplication, percentage, division
    }
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
        
        
    }()
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    //MARK: -Inicialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: -UI numbers
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        opPoint.round()
        opPoint.setTitle(kDecimalSeparator, for: .normal)
        Result()
        
        //MARK: -UI operators
        opAC.round()
        opPlusMinus.round()
        opMinus.round()
        opPercentage.round()
        opDivision.round()
        opResult.round()
        opMultiplication.round()
        opPlus.round()
        
    }
    // MARK: - buttonActions
    @IBAction func opACAction(_ sender: UIButton) {
        clear()
        sender.shine()
        sender.bounce()
    }
    @IBAction func opPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        result.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    @IBAction func opPointAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLenght{
            return
        }
        result.text = result.text! + kDecimalSeparator
        decimal = true
        sender.shine()
    }
    @IBAction func opMinusAction(_ sender: UIButton) {
        Result()
        operating = true
        operation = .substraccion
        sender.shine()
    }
    @IBAction func opMultiplication(_ sender: UIButton){
        Result()
        operating = true
        operation = .multiplication
        sender.shine()
        
    }
    @IBAction func opPercentageAction(_ sender: UIButton) {
        if operation != .percentage{
            Result()
            
        }
        operating = true
        operation = .percentage
        Result()
        sender.shine()
    }
    @IBAction func opDivisionAction(_ sender: UIButton) {
        Result()
        operating = true
        operation = .division
        sender.shine()
    }
    @IBAction func opResultAction(_ sender: UIButton) {
        Result()
        sender.shine()
        sender.jump()
    }
    @IBAction func opPlusAction(_ sender: UIButton) {
        Result()
        operating = true
        operation = .addiction
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        opAC.setTitle("C", for: .normal)
        var ct = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && ct.count >= kMaxLenght{
            return
        }
        if operating {
            
            total = total == 0 ? temp : total
            result.text = ""
            ct = ""
            operating = false
            
        }
        if decimal {
            ct = "\(ct)\(kDecimalSeparator)"
        }
        let num = sender.tag
        temp = Double(ct + String(num))!
        result.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
        
    }
    //MARK: - AC function clean values
    private func clear() {
        operation = .none
        opAC.setTitle("AC" , for: .normal)
        if temp != 0{
            temp = 0
            result.text = "0"
        } else {
            total = 0
        }
        
        
        
    }
    //MARK; - Get final result
    private func Result() {
        switch operation {
        case .none:
            break
        case .substraccion:
            total = total - temp
            break
        case .addiction:
            total  = total + temp
            break
        case .multiplication:
            total = total * temp
            break
        case .percentage:
            temp = temp / (100)
            total = temp
            break
        case .division:
            temp = total / temp
        }
        //MARK: -Formatt on screen
        if total <= kMaxValue || total >= kMinValue {
            result.text = printFormatter.string(from: NSNumber(value: total))
            
        }
        print("total: \(total)")
    }
    
}

