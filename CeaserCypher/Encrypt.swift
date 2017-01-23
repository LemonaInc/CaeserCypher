//
//  Encrypt.swift
//  CeaserCypher (CaeserCypher)

//////////////////////////////////
//  Created by Jaxon Stevens on 1/17/17.
//  Shark backgroun image designed by my friend Phillip Chao based in Los Angeles California.
//  The images used in this project are protected under copyright law, were not created on VFS grounds and were not created using software at VFS. These images should not be used, shown or released outside of this project without given consent of all parties which include Jaxon Stevens and Phillip Chao.
//////////////////////////////////
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//
import Foundation
import UIKit


// Lets create the alphabet for our encryptor 
let sharkAlphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s","t", "u", "v", "w", "x", "y", "z"]

// Lets offset the number by 10. We can change this to any integer between 1 and 25.
func offsetNumber() -> Int {
    
    // Set the character offset to shift (10) This must be set between 1 and 25
    return Int(10)
}

func caeserArray(_ offset:Int) -> [Character] {
    
    // set the array to sharkAlphabet
    var array = sharkAlphabet
    
    // Offset
    let slice = array[0..<offset]
    array.removeSubrange(0..<offset)
    array.append(contentsOf: slice)
    
return array

}

// Encrypt the characters
func encryptCharacter(_ input: Character, encryptedArray: [Character]) -> Character {
    
    if sharkAlphabet.contains(input) {
        let index = sharkAlphabet.index(of: input)
        return encryptedArray[index!]
        
    } else {
        
        // Return input here
        return input

    }
}

func encryptedString(_ stringToEncrypt:String) -> String {
    let lowercaseStringToEncrypt = stringToEncrypt.lowercased()
    
    // The offset of the number is currently 10 this can be changed if needed.
    let offset = offsetNumber()
    let encryptionArray = caeserArray(offset)
    let array = [Character](lowercaseStringToEncrypt.characters)
    
    let encryptedArray = array.map({encryptCharacter($0, encryptedArray: encryptionArray)})
    
    let encryptedString = String(encryptedArray)
        
    
    // Return the offset and display what the encrypted string is when the user presses submit.
    return "\(encryptedString)\n"
}




