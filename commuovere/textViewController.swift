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
  
    
    var image: UIImage!
    //文字を格納する配列
    var textArray: [String] = []
    
    //Date型の配列を宣言
    
    var dataArray: [Data] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if self.image == nil{
            print("--nill--")
        }else{
            self.confirmPhotoView.image = self.image
            //confirmPhotoViewにself.imageにを入れてる（UIImage)
           
        }
        
        
        
        
        if userDefaults.array(forKey: "text") != nil {
            textArray = userDefaults.array(forKey: "text") as! [String]

        }
    
        
        
    }
 
    @IBAction func doneBtn() {
        let data = self.image.pngData()! //データ型に変換
        
        dataArray.append(data)//データ型の配列にデータ型に変換したUIImageを追加
        userDefaults.set(dataArray,forKey: "data") //dataArrayをuserDefaultsをに保存
        textArray.append(textView.text) //配列にテキストを一旦格納 / 配列追加
        userDefaults.set(textArray,forKey: "text")
        print("保存完了")
        
       
   
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
