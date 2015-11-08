//: Playground - noun: a place where people can play

import UIKit
import Foundation

func getContents(text:String)-> String {
    let individualCharacter = text.componentsSeparatedByString(".")
    var tempValue = ""
    for (_,element)
        in individualCharacter.enumerate(){
        tempValue = "\(tempValue) \(element) \n"
    }
    return tempValue
}
getContents("K.w.a.m.e")
func lines(input:String) ->[String] {
    return input.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
}
/// non-functional was of solving problem
func nonFunctionalWay(input:String) -> Int {
    let splittedByNs = getContents(input)
    let convertedIntoArray = lines(splittedByNs)
    return convertedIntoArray.count
}

nonFunctionalWay("K.w.a.m.e")
/// getContents : String->String
/// lines : String->[String]
/// count : [String] -> Int
/// getContents: String->String | lines : String -> [String] | count:[String] -> Int
/// theFunctionalWay : String -> Int
/// create a function on the fly
var functionalWay = {
    data in
     return lines(getContents(data)).count
}

functionalWay("B.R.Y.A.N")




















