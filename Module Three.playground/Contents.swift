// If, Switching, Loops, Ranges & Interpolation
// Or: Lesson three of the Pluralsight course

// If/Else

// Basic Examples he told me to write because I've written in a C-oriented language before.

let a = 1
var score = 38

if (score > 34) { // This is intentionally 'wrong' Parentheses '()' are not required - especially not for something as simple as this. It's more simple to remove them. You can use them if your statement is complex, and they simplify it, but if they don't, well, don't.
    print("Once again, I am the man")
} else {
    print("Still the man, just Built Different")
}

if a == 1 { // Conditions MUST evaluate to boolean values | Braces are REQUIRED
    print("See look ma, I did it!")
} else {
    print("Okay, I still did it, just differently.")
}

// Some quick examples of boolean statements
let carModel = "Ford"
let alternateCarModel = "Mazda"
let userLoggedIn = true

var hiScore = 393
var anOptionalInt:Int?

if hiScore < 400 {} // Checks if hiScore is less than 400
if carModel == "Tesla" {} // Checks if carModel is 'Tesla'
if carModel == alternateCarModel {} // Checks carModel is equal to alternateCarModel
if anOptionalInt != nil {} // Checks if an OPTIONAL int has the value of nil
if userLoggedIn {} // Depends on boolean value. If true, then yes. If false then else.

/* Conditions:
 Equal to: ==
 Is not equal to: !=
 Less than <
 Greater than >
 Less than or equal to <=
 Greater than or equal to >= */

// Conditions with multiple elements
if score > hiScore && carModel == alternateCarModel { // This is an AND statement - both statements must return true for the if statement to proceed - denoted by the &&
    print("Look it's me again!")
} else {
    print("Don't listen to the other guy. I'M THE ONE YOU WANT TO TALK TO!")
}

if userLoggedIn || hiScore == 1 { // This is an OR statement - Either statement can return true for it to proceed, denoted by ||
    print("Look it's me again!")
} else {
    print("Don't listen to the other guy. I'M THE ONE YOU WANT TO TALK TO!")
}


// Switch statements
var volcanoExplosivityIndex: Int // Could be 0 - 8
volcanoExplosivityIndex = 3

switch volcanoExplosivityIndex {
case 0:
    print("Effusive") // Rules! Each case has to be considered
case 1:
    print("Gentle") // Every case must have some runnable code - not just a comment
case 2:
    print("Explosive") // See below, but you can use 'break' if you have nothing to run
case 3:
    print("Catastrophic") // You can have one case for multiple values, just adding a comma between the cases - see below.
case 4:
    print("Cataclysmic") // No automatic fall-through
case 5:
    print("Paroxysmic")
case 6:
    print("Colossal")
case 7:
    print("Super-colossal")
case 8:
    print("Mega-colossal")
default: // Cases in swift are exaustive - every option must be considered - which is why this default string exists.
    print("Not a recognised index.")
    // If you need to explicitly have a case with no running code, you can use
    break
}

volcanoExplosivityIndex = 0

switch volcanoExplosivityIndex {
case 1 ... 8: // Triggers @ 1 through 8, could also be case 1, 2, 3, 4, 5, 6, 7, 8:
    print("A statement that will trigger regardless of index")
default:
    print("Look, I'm just saying that Evan Peters + Tom Holland. HOW COOL WOULD THAT BE")
}

// Loops!
// Like IF statements, loops have optional parentheses, required braces, and the statement MUST give a boolean value

let bunchOfWords = ["Evan", "Peters", "Would", "Complete", "Me", "If", "He", "Teams", "up", "With", "All", "Three", "Spider-men"]

for word in bunchOfWords { // A for loop! Ok, here is the breakdown
    /*
     'word' is a custom, completely-up-to-you definition. It could be theCurrentlySelectedWord and it would still work - as long as I use it in the print statement below
     I don't have to specify tha range of this - it is automatic based on the input. Want it to run 'x' amount of times? Either hard-code it into the loop, or have it save to a variable that gets written to at runtime
     In this case, with an array, it will go for the length - in this case 13 times.
     It will only execute when the input has a value
     */
    print(word)
}

for number in 0...100 {
    print(number)
}


// Striding in for loops
// Lets say I want to iterate every 5 numbers - for example, I want to count 1, 2, 5, 7, 9.
// We do this using stride:

for number in stride(from: 1, to: 563, by: 2) { // This, quite simply, starts at 1...563 and counts up in two - showing every odd number from 0 up to 563 (not including the final value)
    print(number)
}

for number in stride(from: 1, through: 563, by: 2) { // This, quite simply, starts at 1...563 and counts up in two - showing every odd number from 0 up to and including 563
    print(number)
}

for number in stride(from: 50, to: -23, by: -13) { // Same thing, just in reverse
    print(number)
}

// Other types of loops

// Repeat While (known as do while in other languages
// Code will ALLWAYS execute once, and exit once the bottom statement is false
var itemsInQueue = 93

repeat {
    print("Currently processing item \(itemsInQueue)")
    itemsInQueue = itemsInQueue - 1
} while itemsInQueue >= 1 // Will repeat while itemsInQueue is more or equals one.

// While loop
while itemsInQueue < 10 {
    // Imagine adding more items to queue
    itemsInQueue = itemsInQueue + 1
    print("Added another item to queue. Now at \(itemsInQueue) items")
}
// Same as above, but this will ONLY execute if the While statement is true

// String concatonation
let fname  = "Liam"
let lname = "Doyle"
let pos = 2
score = 3923

// This is valid syntax
var msg = fname + " " + lname + " is currently in position " + String(pos) + " with a score of " + String(score)

// But it sucks - so here is a neater option
msg = "\(fname) \(lname) is currently in postion \(pos)! They have a score of \(score)"

// Here is another example - but with added math
let trackName = "Caroline"
let trackArtist = "Arlo Parks"
let trackDuration = 216
msg = "Now playing \(trackName) by \(trackArtist). \(trackDuration / 60):\(trackDuration % 60) remaining."
