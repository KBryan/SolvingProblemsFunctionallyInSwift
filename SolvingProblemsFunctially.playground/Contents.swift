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
// creating a tuple /// returning multiple values from a function
//func returnMultipleValue(value1:String, value2:String) -> (Int,Int) {
//  //  return value1 + value2
//}
getContents("K.w.a.m.e")
func lines(input:String) ->[String] {
    return input.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
}
/// non-functional way of solving problem
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
// f: X -> Y
// g: Y -> Z
// g(f(X)) => Z



// mathematical functional composition
// f: X -> g -> Z
// f(f(X)) => Z
// g(f(X)) : X => Z
/// create custom operator and make values move to the left
infix operator <<< { associativity left }
///
func <<< <A,B,C>(g: B -> C, f: A -> B) -> A -> C {
    return {x in g(f(x)) }
}
var functionalWay2 = lines <<< getContents
var some = functionalWay2("K.w.a.m.e")

// take some function f:(X)->Y
func someFunctionF(someValue1:String) -> String {
    return someValue1
}
// take some function g:(Y)-> Z
func someFunctionG(someValue2:String) ->String {
    return someValue2
}
some[1]
// Generic Tables API
protocol GenericTable {
    func genericTables(x:Int) -> (Int) -> Int
}
struct Tables : GenericTable {
    func genericTables(x:Int) -> (Int) -> Int {
        return { y in x * y }
    }
}
var tablesOfTwo = Tables()
var t2 = tablesOfTwo.genericTables(2)
print ("\(t2(16))")


















