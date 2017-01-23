//
//  ViewController.swift
//  CeaserCypher (CaeserCypher) 

//////////////////////////////////
//  Created by Jaxon Stevens on 1/17/17.
//  Shark backgroun image designed by my friend Phillip Chao based in Los Angeles California.
//  The images used in this project are protected under copyright law, were not created on VFS grounds and were not created using software at VFS. These images should not be used, shown or released outside of this project without given consent of all parties which include Jaxon Stevens and Phillip Chao.
//////////////////////////////////

//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

// We need to import AVFoundaion for the button sound to play
import AVFoundation

class ViewController: UIViewController,UITextFieldDelegate {
    
    // Audio is initated here
    var audioPlayer = AVAudioPlayer()
    
    // OUTLETS
    
    // Lets create a IBOutlet for the input field:
    @IBOutlet weak var userText: UITextField!
    
// This function makes makes the keyboard go away when the user presses enter
    func textFieldShouldReturn(_ userText: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    // Lets create a IBOutlet for the encrypted output text
    @IBOutlet weak var caesarEncryptText: UITextView!
    

    // ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userText.delegate = self
        
        // SUBMIT BUTTON SOUND
        let buttonsound = Bundle.main.path(forResource: "buttonsound", ofType: "mp3")
        // copy this syntax, it tells the compiler what to do when action is received
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonsound! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        
    }
    // SUBMIT BUTTON SOUND END

    // Play sbmit button Sound here
    @IBAction func play(_ sender: AnyObject) {
        audioPlayer.play()
    }
    

    // Create EncryptText Method
@IBAction func encryptText(_sender: AnyObject) {
 
    caesarEncryptText.text = encryptedString(userText.text!)
}

}


