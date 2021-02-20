// Variables, Constants and Arrays


// Variables
var defined = "Hello" // Pretty simple really. As Swift is a Typesafe language, no definition of the variable is required
var undefined:String // This is also valid - the :String is setting the variable as a String as no value is given.
var optionallyUndefined:String? // Again - also valid. This, however, is a optional variable. Basically it doesnt assume that it is going to be given a value. See Optional Variables & constants below


// Constants
let lookItsJustTheSameButWith = "let" // It's exactly the same as above - same rules apply - but with the let keyword rather than var.

// AS AN IMPORTANT MESSAGE - SWIFT CARES ABOUT CONSTANTS. It will nag you to change your variables to constants if they do not change.
// This isnt a runtime error, just a warning.
// If you have run the code above, you will have gotten that warning.
// Essentially - if it doesnt change, make it a constant.


// Optionals

// This is for use when you are going to have a variable or constant that is not guaranteed to have a value
// For example, a middle name or secondary email.
// We do this by appending '?' to the data type when declaring the variable.
// Obviously this only applies when there is no data to declare at creation
// These are seperate data types - for example Int? is different to Int
// They are the same data type, just wrapped. To use them, you have to unwrap them.
// they are also the only variables/constants that can be set to nil

let a: Int?
let b = 393.3

type(of: a)

a = 394

// let lmao = a? + Int(b)

if a != nil { // Checking for nil
    // Forced unwrapping, we 'Know' this is not nil (just checked on line 10) so we are forcibly ripping the variable out.
    // FORCIBLY UNWRAPPING AN OPTIONAL - if there is no optional - WILL CRASH THE PROGRAM!
    // So only do it when you know, as such with the If statement (line 10)
    let unwrappedA = a!
    print(unwrappedA)
}

// Optional binding
if let unwrappedA = a { // Only returns as true if 'a' has a value as an optional value.
    print(unwrappedA) // This enters in - same as any other if statement - and prints
}
// We can obviosuly do if/else on this
else { // no value
    print("Hello! No value.")
}


// Arrays
// Quick TLDR;
// Array: an ordered collection of items
// Dictonary: a collection of key/value pairs (think JSON)
// Set an unordered collection of items

// Arrays are 0-based
// Arrays are Type-safe. The entire array is one thing (int/string/bool etc)
// Can be declared using var or let

// Array of stings
let musicalModes = ["Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Minor"]
// Note the square brackets, commas, and the fact that these are strings. Me adding a 0, or a false, imma get an error.
// As an aside, the following works fine"
var randomNumbers = [2, 38, 3829, 28, 4, 5468,] // Note that comma on the end? Yea. Swift don't care. 😎
// Also the fact that this is a variable rather than a constant has nothing to do with it.

// Getting data out of arrays
print(randomNumbers[3]) // Fairly self-explanitory.
print(musicalModes[2]) // Number on end refrences index of array, if you were not sure.
// NOTE: Not sure why '\n' is being appended to the end of the print statements? Pretty sure \n is new line
let musicalModeFromArray = musicalModes[0]
let randomNumberFromArrayOfRandomNumbers = randomNumbers[3]
// I'd like to say that I am intentionally not enforcing good practice with the variable names. They are desciptive, but rather long.
// Just makes very quick refrencing easier.

// Adding new elements
randomNumbers.append(9384)
// See look it's added!

// Remove an element
randomNumbers.remove(at: 0) // Option one - remove at a specific index
randomNumbers.removeAll() // Option two - guess! (Hint: if you guessed it removes all variables, you are right on the money.)
randomNumbers = [2, 38, 3829, 28, 4, 5468,] // Adding values back after deleting (see line 88)
randomNumbers.removeLast()
randomNumbers.removeFirst() // These two are pretty self-explanatory. These return a string! So you can pass the removed value into another variable
let theRemovedElement = randomNumbers.removeLast()

// TYPE ANNOTATION
let myStringArray: [String] // Same as before, just now with brackets!
// Now, before we add data, we have to initialised this array - like this:
myStringArray = [] // But we are lazy programmers, so there is obviously a one-line solution;
let anotherArrayToDemonstrate: [String] = [] // This now works just fine, and is initialised.

// Thats it! On 100 lines too!
