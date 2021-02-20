// Defining your own datatypes

// Sometimes you want more control over your variables. Maybe you want to define a type of something, or select something from a predefined list.
// This is where enumerations come in

// For example, I might want to declare something as a Book, or a movie, or a song.
// Now I could use 0 for book, 1 for movie and 2 for song - having the type of that variable as an interger.
// But intergers go up (and down) a lot higher than 2.

enum MediaType { // note that the name of this enumeration is in UpperCamelCase, as are Variable types in Swift.
    case book // These can be also done on one line (so case book, movie, tv show etc) but this looks neater
    case movie
    case music
    case game
    case documentary
    case podcast
}

var itemType: MediaType // You cannot declare this in one line, you have to first assign the enumeration
itemType = MediaType.book // then the case inside the enumeration

itemType = .movie // As I have already declared the type (line 19, not line 20) this is also valid

// Example of using in a switch statement
switch itemType {
case .book:
    print("This is a \(itemType)")
case .movie:
    print("This is a \(itemType)")
case .music:
    print("This is \(itemType)")
case .game:
    print("This is a \(itemType)")
case .documentary:
    print("This is a \(itemType)")
case .podcast:
    print("This is a \(itemType)")
}

// Structs

struct Album {
    // Properties of the structure
    var albumName: String
    var songTitles: [String]
    var genre: String
    var artist: String
    var releaseYear: Int
    
    // Methods
    func summary() -> String {
        return "\(albumName), by \(artist) was released in \(releaseYear) under the genre \(genre)." // Not going to deal with titles here, but you get the point
    }
}
// Making a new structure
var newAlbum = Album.init(albumName: "Free Spirit", songTitles: ["Intro", "Bad Luck", "My Bad", "Better" /* Etc. */], genre: "R&B/Soul", artist: "Khalid", releaseYear: 2019)
print(newAlbum.albumName) // etc

// Adding in some of the rest of missing songs
let restOfSongs = ["Better", "Talk", "Right Back", "Don't Pretend", "Paradise", "Hundred", "Outta My Head", "Free Spirit"]
for song in restOfSongs {
    newAlbum.songTitles.append(song)
    print("Added '\(song)' to '\(newAlbum.albumName)'")
}

print(newAlbum.summary())

// Dictionaries

var airlines = ["SWA": "Southwest Airlines",
                "BAW": "British Airways",
                "BHA": "Buddha Air",
                "CPA": "Cathay Pacific"
]

// Use [] to look up key
if let result = airlines["SWA"] { // Forcibly opening up the result as Swift returns an optional
    print(result)
} else {
    print("No match found")
}

// To Add or change
airlines["DVA"] = "Discovery Airlines" // Even though this does not exist inside the Array, calling this will create it.
airlines["BHA"] = "notBuddha Air" // Demonstration of changing
if let result = airlines["BHA"] {
    print(result)
} else {
    print("Something has gone wrong")
}
airlines["BHA"] = "Buddha Air" // Reset


// To remove, set to nil
airlines["DVA"] = nil // Removes both value AND key

// Can use for loops:
for airline in airlines {
    print(airline)
}

// to only get the key || value
for (key, value) in airlines { // tempoary constants key & value are still namable by me - could be code, airlines for example
    print("\(key) has a value of \(value)")
}

// Tuples
// Pretty much basic arrays.

// Can come in handy if you need to return more than one bit of data from an array
func randomAlbum() -> (albumTitle: String, albumArtist: String, releaseYear: Int) {
    let title = "Highway to Hell"
    let artist = "AC/DC"
    let year = 1979
    
    return (title, artist, year)
}

// To decompile the tuple
let result = randomAlbum()
print(result.releaseYear) // Can do this, or just print out the function directly as on line below.
print(randomAlbum().albumTitle)

// I can also immediately break it up on call
let (albumTitle, albumArtist, albumYear) = randomAlbum() // Note: What I break it up into doesn't need to be the same, they just happen to be pretty obvious in current context.
print(albumArtist)
