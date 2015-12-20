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
some.count
// take some function f:(X)->Y
func someFunctionF(someValue1:String) -> String {
    return someValue1
}
// take some function g:(Y)-> Z
func someFunctionG(someValue2:String) ->String {
    return someValue2
}
// compose the two functions together


// Generic Tables API
protocol GenericTable {
    func genericTables(x:Int) -> (Int) -> Int
    // currying example in swift
    func genericTablesCurrying(x x:Int)(y:Int) -> Int
}
protocol Addable {
    func +(lhs: Self,rhs: Self) -> Self
}
struct Tables : GenericTable {
    
    func add<T:Addable>(a:T,b:T) ->T {
        return a+b
    }
    func genericTables(x:Int) -> (Int) -> Int {
        return { y in x * y }
    }
    func genericTablesCurrying(x x:Int)(y:Int) -> Int {
        return x * y
    }
}
var tablesOfTwo = Tables()
var t2 = tablesOfTwo.genericTables(2)
print ("\(t2(16))")
/// Currying
var tablesCurrying = tablesOfTwo.genericTablesCurrying(x: 4)
tablesCurrying(y: 3)
/// Fun with closures
func operate(a:Int,b:Int, fn:(Int,Int) ->()) {
    fn(a,b)
}
func add(x:Int,y:Int) {
    print(x+y)
}
operate(4, b: 4, fn: add)

operate(3, b: 3, fn: { (a, b)  in print(a + b) })


//
struct ObjectA  {
    
    private var name:String!
    private var emailAddress:String!
    
    
    func testFunction(x:Int,y:Int, completionHandler:(Int,Int) -> (Int)) {
        completionHandler(x,y)
    }
}


extension ObjectA : Equatable {}

func ==(lhs:ObjectA, rhs:ObjectA) -> Bool {
    return lhs.name == rhs.name
}

let someObjectA = ObjectA(name: "John", emailAddress: "Kwame@3einteractive.com")
let someObjectB = ObjectA(name: "Kwame", emailAddress: "Kwame@3einteractive.com")

someObjectB.testFunction(20, y: 20) { (x:Int, y:Int) -> (Int) in
    return x * y;
}

someObjectA == someObjectB

let addedSum = someObjectA.testFunction(4, y: 5) { (x:Int, y:Int) -> Int in
    return x * y
}
print(addedSum)
func curriedFunction(a:Int)(b:Int)(c:Int...) -> (Int,Int,[Int])  {
    return (a,b,c)
}
let r = curriedFunction(5)(b:30)(c:45,34,3,4,5,3,34,678)


curriedFunction(4)(b:5)(c:10)
final class Box<T> {
    var unbox:T
    init(_ value:T) {
        unbox = value
    }
}
/// Curried function simplifies inner function syntax
/// An example of a curried function
func aSimplifiedCurriedFunction(a:Int)(b:Int)(c:Int) -> Int {
    return a + b + c
}

func incFn()-> (Int)->(Int) {
    return {
        var a = $0
        a+=1
        return a
    }
}


var myFunction = incFn()
myFunction(4)















