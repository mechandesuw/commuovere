//
//  textViewController.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/05/07.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {
    
    var userDefaults = UserDefaults.standard

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var confirmPhotoView: UIImageView!
    
    var image: UIImage? = nil
    
    //文字を格納する配列
    var textArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.confirmPhotoView.image = self.image
        
        if userDefaults.array(forKey: "text") != nil {
            textArray = userDefaults.array(forKey: "text") as! [String]
            
        }
     
    }
 
    @IBAction func doneBtn() {
        textArray.append(textView.text) //配列にテキストを一旦格納
        userDefaults.set(textArray,forKey: "text")

    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
