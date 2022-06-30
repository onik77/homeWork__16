//
//  main.swift
//  homeWork__16
//
//  Created by Onik Grigoryan on 30.06.22.
//






import Foundation
///

class Point {
    var x: Double
    var y: Double
    
    init(x: Double , y: Double) {
        self.x = x
        self.y = y
    }
}


class Rect {
    var origin: Point
    var widht: Double
    var height: Double
    
    init(origin: Point , widht: Double , height: Double) {
        self.origin = origin
        self.widht = widht
        self.height = height
    }
    
    convenience init() {
        self.init(origin: Point(x: 2, y: 3), widht: 23, height: 2)
    }
}


class Color {
    var red: Double
    var green: Double
    var blue: Double
    
    init(red: Double , green: Double , blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}


//1. Ստեղծել Class View անունով (հետևյալ փրոփրտիներով frame: Rect, backgroundColor: Color, tag: Int)
//որը պետք է ունենա հետևյալ init-ները`
//- init(frame: Rect, backgroundColor: Color, tag: Int)
//- init(frame: Rect, backgroundColor: Color)
//- init(frame: Rect)
//- init()

class View {
    var frame: Rect
    var backgroundColor: Color
    var tag: Int
    
    init(frame: Rect, backgroundColor: Color, tag: Int) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.tag = tag
    }
    convenience init(frame: Rect , backgroundColor: Color) {
        self.init(frame: Rect(origin: Point(x: 1, y: 2), widht: 2, height: 4), backgroundColor: Color(red: 1, green: 4, blue: 3), tag: 0)
    }
    convenience init(frame: Rect) {
        self.init(frame: Rect(origin: Point(x: 2, y: 3), widht: 34, height: 234), backgroundColor: Color(red: 34, green: 32, blue: 1))
    }
    convenience init() {
        self.init(frame: Rect(origin: Point(x: 2, y: 3), widht: 3, height: 2))
    }
}
let view = View(frame: Rect(origin: Point(x: 1, y: 0), widht: 0, height: 0), backgroundColor: Color(red: 1, green: 0, blue: 0))
print(view.frame.origin.x)


//2. Ստեղծել Class GITCViewController անունով (հետևյալ փրոփրտիներով view: View, navigationTitle: String)
//որը պետք է ունենա հետևյալ init-ները`
//- init()
//- init(navigationTitle: String)
//- init(frame: Rect)


class GITCViewController {
    var view: View
    var navigationTitle: String
    
    init() {
        self.view = View()
        self.navigationTitle = "Start"
    }
    
    init(navigationTitle: String) {
        self.navigationTitle = navigationTitle
        self.view = View()
    }
    
    init(frame: Rect) {
        self.view = View()
        self.navigationTitle = "Intern"
        self.view.frame = frame
    }
}
let viewController = GITCViewController(frame: Rect(origin: Point(x: 1, y: 1), widht: 2, height: 2))
print(viewController.view.frame.widht)


//3. Ստեղծել struct PhoneNumber անունով (հետևյալ փրոփրտիներով code: String number: String)
//որը պետք է ունենա հետևյալ init-ները`
//- init?(code: String, number: String) code և number չեն կարող լինել դատարկ
//-init?(number: String)  number  չեն կարող լինել դատարկ code = “+374”


struct PhoneNumber {
    var code: String
    var number: String
    
    init?(code: String , number: String) {
        if code.isEmpty || number.isEmpty {
            return nil
        }
        self.number = number
        self.code = code
    }
    
    init?(number:String) {
        if number.isEmpty {
            return nil
        }
        self.number = number
        self.code = "+374"
    }
}
let phoneNumber = PhoneNumber(code: "+374", number: "33157715")
print(phoneNumber!)



//4. Ստեղծել Class CallManager անունով (հետևյալ փրոփրտիներով callFrom: PhoneNumber, callTo: PhoneNumber)
//որը պետք է ունենա հետևյալ init-ները`
//- init?(callFrom: PhoneNumber?, callTo: PhoneNumber?) callFrom և callTo չեն կարող լինել nil
//- Init?(callFrom: String, callTo: String) code- ի երկարությունը 4 է,  callFrom և callTo չեն կարող լինել դատարկ


class CallManager {
    var callFrom: PhoneNumber
    var callTo: PhoneNumber

    func countInCode(_ countTheNewCode: String) -> String {
        var countInTheCode = countTheNewCode
        if countInTheCode.count < 0 {
            print("is empty")
        } else if countInTheCode.count == 4 {
            countInTheCode = countTheNewCode
            return countTheNewCode
        }
        return "Code have a +374"
    }

    init?(callFrom: PhoneNumber?, callTo: PhoneNumber?) {
        if callTo == nil || callFrom == nil {
            return nil
        }
        self.callTo = callTo!
        self.callFrom = callFrom!
    }
   convenience init?(callFrom: String, callTo: String) {
       self.init(callFrom: PhoneNumber(code: "+786", number: "42323"), callTo: PhoneNumber(code: "+333", number: "2211133"))
       self.callTo.number = callTo
       self.callFrom.code = countInCode(callFrom)
    }
}
let callManager = CallManager(callFrom: "+374", callTo: "95779909")
print("code is a \(callManager!.callFrom.code) - number is a \(callManager!.callTo.number)")


//5. Ստեղծել Enum RequestMethod անունով հետևյալ հավանական արժեքներով post, get, delete

enum RequestMethod  {
    case post
    case get
    case delet
}

//6. Ստեղծել Class LoadDataFromServer անունով  (հետևյալ փրոփրտիներով requestUrl: String, requestMethod: RequestMethod)
//որը պետք է ունենա հետևյալ init-ները`
//init?(requestUrl: String, requestMethod: RequestMethod)


class LoadDataFromServer {
    var requestUrl: String
    var requestMethod: RequestMethod
    
    init?(requestUrl: String, requestMethod: RequestMethod) {
        self.requestUrl = requestUrl
        self.requestMethod = requestMethod
    }
}

let lDFS = LoadDataFromServer(requestUrl: "new id", requestMethod: RequestMethod.post)
print(lDFS!.requestMethod)

switch lDFS?.requestMethod {
case .post:
    print("it is a post")
case .get:
    print("it is a get")
case .delet:
    print("it is a delet")
case .none:
    print("this case is a HAVAI grats")
}


