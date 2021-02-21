// Protocols

class Player: CustomStringConvertible {
    // If I was also calling on a superclass, this would go class Player: SomeSuperClass, SomeProtocol, SomeProtocol {
    
    // Stored properties
    var name: String
    var livesRemaining: Int
    var enemiesDestroyed: Int
    var penalty: Int
    var bonus: Int
    
    // Computed properties
    var score: Int {
        get {
           //return((((enemiesDestroyed + 1) * 10) / penalty) + bonus)
           // Currently this throws an error for some reason - Fatal error: Division by zero: file Swift/x86_64-apple-ios-simulator.swiftinterface, line 32383
           // Debugging seems to hint at this equation - regardless of the math - seems to trip it.
           return(854) // Tempoary fix
        }
    }
    
    // Protocol properties
    var description: String {
        return "Player \(self.name), with a score of \(self.score). \(self.livesRemaining) Lives remaining"
    }
    
    // Init
    init (inputName: String) {
        self.name = inputName
        self.livesRemaining = 3
        self.enemiesDestroyed = 0
        self.penalty = 0
        self.bonus = 0
    }
}

// Create a new player
let p1 = Player(inputName: "Wade") // Error from computed (line 14...21) errored here.
let p2 = Player(inputName: "Anorak")

// Add random values to simulate play
p1.livesRemaining = 3
p1.enemiesDestroyed = 3848
p1.penalty = 38
p1.bonus = 348

p2.livesRemaining = 2
p2.enemiesDestroyed = 39483
p2.penalty = 389
p2.bonus = 245

// If I called p1 or p2 before, I would have gotten this '__lldb_expr_136.Player'
print(p1)
print(p2)

// Defining a protocol
protocol MyProtocol {
    // Methods are required
    func showMessage()
    
    // Properties
    var name: String { get } // The curley braces are required here. Get means a read-only property
    var waterTempreature: Double { get set } // Get Set means a read/write property
}

// Conforming to protocols
//struct MyStruct: MyProtocol {
//
//}
// The above is enough to 'adopt' a protocol. But MyProtocol requires a function called showMesssage and properties name and waterTempreature, so won't have conformed. I have to conform for it to work.
protocol MyProtocolReimagined {
    // Methods are required
    func showMessage()
    
    // Properties
    var name: String { get } // The curley braces are required here. Get means a read-only property
}


struct MyStruct: MyProtocolReimagined {
    func showMessage() {
        print("Anything I like here")
    }
    
    var name: String {
        return "Liam"
    }
}


// Errors!
// Could have really used this on line 14
/*
 Unlike some languages, swift does not have an error type - it is up to you to make one
 You can provide them how you want - class/struct/enum etc.
 They can be as complex or as simple as you wish
 */

enum ServerError: Error { // Add in the error protocol
    case noConnection
    case serverNotFound
    case authenticationRefused
}

/*
 The error protocol does not require anything - unlike the ones I have been dealing with pre line 90
 You dont have to add anything - this is just telling Swift that the enum ServerError is something I will throw if an error happens
 */

// Basic setup for error
func checkStatus(serverNumber: Int) throws -> String { // note the throw statement here - this is used if something might error.
    switch serverNumber {
    case 1:
        print("You have no connection")
        throw ServerError.noConnection // this throws the error
    case 2:
        print("Authentication failiure")
        throw ServerError.authenticationRefused
    case 3:
        print("Server is up and running!")
    default:
        print("Cannot find that server")
        throw ServerError.serverNotFound
    }
    return "success!"
}
// While this code is perfectly fine normally, as I am now saying that this code could error, I have to call it differently
//let result = checkStatus(serverNumber: 1) // This is manual - feel free to play with the input yourself!
//print(result)
//

// Handling errors
do {
    let result = try checkStatus(serverNumber: 1) // This is manual - feel free to play with the input yourself!
    print(result)
} catch { // This is just a generic catch block
    print("The problem is \(error)")
}

// if I wanted more specific code to trigger based on what actually errored, I could do this
do {
    let result = try checkStatus(serverNumber: 1)
    print(result)
} catch ServerError.authenticationRefused{
    // Retry auth, reprompt etc
    print("The problem is")
} catch ServerError.noConnection {
    // Show prompt to reconnect ect
    print("No connection available")
} catch ServerError.serverNotFound {
    // Try later etc
    print("Server has walked off")
}

// If you have something where you are fine with if it doesnt work that your program just continues then
let result = try? checkStatus(serverNumber: 3) // if something returns, then wonderful. Otherwise, nil

if result != nil {
    print(result!)
}

// Guard
// Guard is basically an if else statement, but it will guard a bit of code.
// It essentially is very useful in checking that values are within ranges - or have values at all - before they have to go do eomthing critical
guard s else {
    <#statements#>
}
