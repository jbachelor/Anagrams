//: Playground - noun: a place where people can play

import UIKit

func randomNumber(min min: Int, max: Int) -> Int {
    let uMin = UInt32(min)
    let uMax = UInt32(max)
    
    return Int(arc4random_uniform(uMax-uMin) + uMin)
}

//for i in 0...1000 {
//    let randomNum = randomNumber(min: 5, max: 10)
////    print(randomNum)
//    if randomNum == 9 {
//        print("****************")
//    }
//    
//}

print(#file.componentsSeparatedByString("."))