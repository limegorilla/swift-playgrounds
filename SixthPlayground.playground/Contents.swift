// Closures

// Difference between functions & closures
// A function is a group of code you want to call
// A closure is a group of code you want to pass

// You are writing that code to hand it over to something else - maybe something you/a team member made, or (more likley) a library, frameworks etc.

// This is useful for things like sorting arrays, as I shall demonstrate

struct Song {
    var name: String
    var artist: String
    var releaseYear: Int
    var duration: Int
}

let song1 = Song.init(name: "Rust", artist: "Soft Glass", releaseYear: 2021, duration: 253)
let song2 = Song.init(name: "87 Days", artist: "Haich Ber Na", releaseYear: 2021, duration: 221)
let song3 = Song.init(name: "On Read", artist: "Lucky Daye", releaseYear: 2020, duration: 244)
let song4 = Song.init(name: "Buzzin", artist: "Aminé", releaseYear: 2010, duration: 220)

// Make array of songs
let arrayOfSongs = [song1, song2, song3, song4]
 
// First, I'm going to make a simple function to call on two songs and return true or false based on which one is longer.
func compareDuration(firstSong: Song, secondSong: Song) -> Bool { // Takes two inputs under 'song' and returns a boolean
    if firstSong.duration <= secondSong.duration {
        return true // If first song is shorter in duration than second
    } else {
        return false // Inverse of above.
    }
}

// This - Above - is essentially what I am doing. I'm going to pass this into the 'sorted' method, which will return a sorted array by doing what I did in compareDuration
// It's going into a constant as I am returning the sorted array back

var songsByDuration = arrayOfSongs.sorted(by: compareDuration) // If you run this in a playground, you'll see that this is sorting! You'll note that I DONT have a set of brackets after the function name - this is essentially because I am passing the code into the sorted method.

songsByDuration
songsByDuration = arrayOfSongs // Resetting the sorted array
songsByDuration

// It requires I write a function though, and that is - needlessly - rather verbose - especially if I am never going to use that function again

// STEP ONE: Get rid of the function keyword and function name
//(firstSong: Song, secondSong: Song) -> Bool { // Takes two inputs under 'song' and returns a boolean
//    if firstSong.duration <= secondSong.duration {
//        return true // If first song is shorter in duration than second
//    } else {
//        return false // Inverse of above.
//    }
//}
// Swift doesn't understand this, so we now need to;

// STEP TWO: Place the inputs inside the braces
//{
//    (firstSong: Song, secondSong: Song) -> Bool
//    if firstSong.duration <= secondSong.duration {
//        return true // If first song is shorter in duration than second
//    } else {
//        return false // Inverse of above.
//    }
//}
// Problem is now, swift doesnt have a boundary between the inputs, outputs and the actual calculation, so;

// STEP THREE: We now add the 'in' keyword to seperate the i/o & calculation
//{
//    (firstSong: Song, secondSong: Song) -> Bool
//    in
//    if firstSong.duration <= secondSong.duration {
//        return true // If first song is shorter in duration than second
//    } else {
//        return false // Inverse of above.
//    }
//}
// So. Now our function is just a block of code we can paste in somewhere else - we are only calling on it once, so this makes sense.

songsByDuration = arrayOfSongs.sorted(by: {
    (firstSong: Song, secondSong: Song) -> Bool
    in
                                     if firstSong.duration <= secondSong.duration { // Same function, now just inline.
                                            return true
                                        } else {
                                            return false
                                        }
})

songsByDuration // As you can see, doing the same thing here. Same result as up top (line 40)
songsByDuration = arrayOfSongs // Resetting array
songsByDuration

// This is still pretty heavy though. The closure is now the argument, but there is a lot of code - plus it is also inside the () which can make for difficult reading.



// Making the closure simpler
songsByDuration = arrayOfSongs.sorted(by: {
    // We can get rid of the i/o because the only things allowed here are Songs - it's all that is being parsed in.
    // Problem is is that this has now lost its identification for firstBook and secondBook, so;
                                     if $0.duration <= $1.duration { // It's still dealing with two arguments at a time only, and already natively giving them names from $0 ...
                                            return true
                                        } else {
                                            return false
                                        }
})
// Only two arguments is defined by the .sorted method - see documentation for info.
songsByDuration // As you can see, doing the same thing here. Same result as up top (line 40)
songsByDuration = arrayOfSongs // Resetting array

// We can make this simpler though - our closure is the only argument here, so we can take it outside the (by: ) to make it easier to read:
songsByDuration = arrayOfSongs.sorted { // Note we have no (by: ) at all. If there was another argument AFTER this though, this one would have to be inside the (by: )
    if $0.duration <= $1.duration {
        return true
    }
    else {
        return false
    }
}
// This is called a trailing closure.
songsByDuration // Same as line 40
songsByDuration = arrayOfSongs // Reset

// Final simplifications;
songsByDuration = arrayOfSongs.sorted { // in this case, we are just asking for a simple boolean response - we don't need multiple return statements
    return $0.duration <= $1.duration
}
songsByDuration // Same as line 40
songsByDuration = arrayOfSongs

// Or alternatively,
songsByDuration = arrayOfSongs.sorted { $0.duration <= $1.duration } // As I can only return a boolean, the return keyword is also somewhat redundant, so I can remove

/*
Note how it happens 7 times, dispite me only entering in 4 songs? This is because while all I am doing is working out if the duration is shorter from the first to the second input, swift  .sorted method is using that info to sort the array.
 */
songsByDuration

