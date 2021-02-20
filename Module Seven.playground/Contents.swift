// Classes

class Appliance { // Classes need initialisers as whenever a class is created it creates the following properties as variables
    // Properties
    var manufacturer: String = ""
    var model: String = ""
    var voltage: Int = 0
    var capacity: Int? // This doesnt need an intialiser as it is an optional value
    
    // Methods
    func getDetails() -> String {
        var message = "This is the \(self.model) from \(self.manufacturer)."
        if self.voltage >= 220 {
            message += "This model is for European use only."
        }
        return message
    }
}

// later, creating an instance of Appliance
var kettle = Appliance()
kettle // If you view the properties for this line, you can see that it has the default values I assigned above

kettle.manufacturer = "Bosh"
kettle.model = "Intrestting Kettle Model Name"
kettle.voltage = 120

kettle // Values have changed from line 22
print(kettle.getDetails())

// Replacing the default values
class ApplianceRemastered {
    // Rather than assigning the default values, which can lead to weird code, we can make an initialiser.
    
    // Properties
    var manufacturer: String
    var model: String
    var voltage: Int
    var capacity: Int?
    
    // Initializer
    init() {
        self.manufacturer = "Default manufacturer"
        self.model = "Default model"
        self.voltage = 0
        // Capacity does not need to be intialised as it is optional
    }
    // Now this works, although I still have to set the values after making the class.
    // Instead, I can make an intialiser that will pass through all the values at the time of making the class, like this;
    init(inputManufacturer: String, inputModel: String, inputVoltage: Int, inputCapacity: Int) {
        self.manufacturer = inputManufacturer
        self.model = inputModel
        self.voltage = inputVoltage
        // I can also intialise capacity, as I have done here. Problem is, though, is that it is now REQUIRED - even though it is set as an optional Int.
        self.capacity = inputCapacity
    } // You could also make seperate initialisers for different cases - say I knew I wouldnt need to intialise Voltage on some for example.
    
    // Deinitializer
    // This is used rarely, and not by me, but by Swift's memory controller
    // If it detects that an object has fallen out of scope, it will drop it from memory after running anything inside the deinit clause
    deinit {
        // Perform action - such as release a resource, remove tempoary files
    }
    
    // Methods
    func getDetails() -> String {
        var message = "This is the \(self.model) from \(self.manufacturer)."
        if self.voltage >= 220 {
            message = "\(message) This model is for European use only." // Improved with insertion.
        }
        return message
    }
}

var oven = ApplianceRemastered(inputManufacturer: "Mile", inputModel: "An intresting name for an oven", inputVoltage: 372, inputCapacity: 383)
print(oven.getDetails())

/*
 You might be going, well gee liam, classes do sure seem similar to structs.
 Well, your right.
 
 -- definitly just had this conversation in my head --
 
 So in short, classes and structs are VERY similar. But there are differences.
 
 
 1. Initialising
 Swift allow structs to be initialised without an initialiser and inline.
 So this is perfectly valid
 
 struct Car {
    var make: String
    var model: String
    var year: Int
 }
 var newCar = Car(make: "Mazda"", model: "Mazda2", year: 2013)
 
 If I tried to do the same with a CLASS, not a struct, I would not be able to initialise inline (anything in the parenthesis above would be unparsable)
 I would either need to
 - Assign default values in the Class
 - Have an intialiser in the class which I would call during creation
 
 
 2. Inheritance
 Simple one this - although we have not touched inheritance yet, simple thing is Classes DO support inheritance, Structs do NOT.
 
 
 3. Types
 This is (apparently) the most important one
 Structs are Value types, classes are refrence types.
 What does this mean?
 When you create an instance of a struct, and use it with a function or variable, it is copied. Exactly like ⌘ + c, ⌘ + v
 When you create an instance of a class, it is refrenced. What does this mean? See below
 */

// Refrencing
class Message {
    // Properties
    var content: String
    
    // Initialiser
    init(msg: String) {
        self.content = msg
    }
}

var firstMessage = Message(msg: "Hey look ma, I am in a string!")
print(firstMessage.content)
// So I have currently made a class, Message, and created an instance of that class, firstMessage
// Currently it has the value of "Hey look ma, I am in a string!"
var secondMessage = firstMessage // This is where things change. In theory, I just copied firstMessage over to secondMessage
// Now I am going to add some content to secondMessage - NOT first message.
secondMessage.content += " But now I have gone and screwn it up."
// You would guess that secondMessage now has the value of "Hey look ma, I am in a string! But now I have gone and screwn it up."
// But as you can probably guess, it's not just secondMessage
print("FIRST MESSAGE IS: \(firstMessage.content) \nSECOND MESSAGE IS: \(secondMessage.content)") // \n just newlines on the console.
// As you can see - Same variable.

// To add more clarity, here is the exact same code, but without the comments, and changed over to a struct
struct MessageStruct {
    // Properties
    var content: String
}

var thirdMessage = MessageStruct(content: "Here is a different string so the console doesnt get really confusing!")
print(thirdMessage.content)

var fourthMessage = thirdMessage

fourthMessage.content += " See, I'm nice to you like that."

print("THIRD MESSAGE IS: \(thirdMessage.content) \nFOURTH MESSAGE IS: \(fourthMessage.content)")

// Working out if something refrences another object
// We use the identity operator (===) which only works on classes
// Going back to using firstMessage and secondMessage
if firstMessage === secondMessage {
    print("Yes, they both refrence the same thing, currently '\(firstMessage.content)'")
}

// Okay - what about constants?
// If I initialised firstMessage as a constant, like this
let fifthMessage = Message.init(msg: "Okay, this is weird.")
// I can still change it
fifthMessage.content += " See I shouldn't be able to do this"
print(fifthMessage.content)

// See what I can't change is what class fifthMessage POINTS to - but it's contents? Those are a property of Message, and are therefore, able to be changed.
// As a note, if Message.content was defined as let, not var then I would only be able to change it when I initialised it. (So once.)

print("==================\nI'm going to break up the console a bit\n==================\nINHERITANCE:")

// Inheritance
class Vehicle {
    // Properties
    var make: String
    var model: String
    var releaseYear: Int
    
    // Initialiser
    init(inputMake: String, inputModel: String, inputReleaseYear: Int) {
        self.make = inputMake
        self.model = inputModel
        self.releaseYear = inputReleaseYear
    }
}
// This is a fairly simple class that I can call like so;
let car1 = Vehicle(inputMake: "Mazda", inputModel: "Mazda2", inputReleaseYear: 2012)
car1 // which makes this 'vehicle'
// However, maybe I want a subclass called Car, that contains more information

class Car: Vehicle { // Note the superclass 'Vehicle'
    // Properties
    let wheels = 4
    let colour: String
    
    // Because I am adding in a new variable that does not get assigned a default value when being initialised
    // I have to redo the init from Vehicle (currently I am inheriting it)
    // If I had no new properties - say extra functions - this would not be needed
    
    // Init
    init (passthroughMake: String, passthroughModel: String, passthroughReleaseYear: Int, inputColour: String) { // Passing through the variables for Superclass
        self.colour = inputColour // Assign this locally to the subclass
        super.init(inputMake: passthroughMake, inputModel: passthroughModel, inputReleaseYear: passthroughReleaseYear) // Send this up to the original superclass init.
    }
    // Sidenote - this took me a while to get my head round - my course did not cover this that well.
    // Highly reccomend the actual swift docs on the subject: https://docs.swift.org/swift-book/LanguageGuide/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203
    
    // Methods
    func startCar() {
        // Code to start car here.
        print("Car Started")
    }
}

let car2 = Car(passthroughMake: "Ford", passthroughModel: "Fiesta", passthroughReleaseYear: 2003, inputColour: "A nice Blue")

car2.startCar()

// Okay, now lets move on to Extentions
// Extentions work with not just classes, but structs and enums
// It doesnt rely on inheritance and the headaches it causes.
// So lets say I want to make a method for a strings to be able to remove profanity.
// Now we cant change strings - we are not allowed. It's also a struct - so no inheritance

extension String {
    func removeLetters() -> String { // Called using .removeLetters, available on any string
        let filteredCharecters = self.filter { $0 != " " } // $0 loops through each charecter, if not a " ", adds it to filteredCharecters
        return String(filteredCharecters) // Returns!
    }
}

let newInnocentString = "So this will not make much sense"
print(newInnocentString.removeLetters())

// Computed properties
// These are useful when you need to quickly do math (or other compute to a property)
// And it doesnt make sense to call a function
// For example, a score that is based on lives remaining, penalty, bonus and enemies destroyed
// I could write a function that returns a variable, but I cannot write to that function, and it seems a bit verbose.

class Player {
    // Stored properties
    var name: String
    var livesRemaining: Int
    var enemiesDestroyed: Int
    var penalty: Int
    var bonus: Int
    
    // Computed properties
    var score: Int {
        get {
            return((((enemiesDestroyed * 1000) * livesRemaining) / penalty) * bonus)
        }
        // set { // If I wanted to save to the variable, I would use this
        // CODE HERE
        // }
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
let newPlayer = Player(inputName: "NoobMaster69")

// Add random values to simulate play
newPlayer.livesRemaining = 2
newPlayer.enemiesDestroyed = 384
newPlayer.penalty = 34
newPlayer.bonus = 394348

print(newPlayer.score)

// Wow. This was a monster.
