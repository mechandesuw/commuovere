//
//  textViewController.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/05/07.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit


class TextViewController: UIViewController, UITextViewDelegate, UIScrollViewDelegate{
    
    var userDefaults = UserDefaults.standard


    @IBOutlet weak var textView: UITextView! {
        didSet {
        
            textView.delegate = self //デリゲートをセット
    }
        }
    
    
    
    @IBOutlet weak var confirmPhotoView: UIImageView!
  
    //画像を受け取るためのプロパティ
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
        
        if userDefaults.array(forKey: "data") != nil {
            dataArray = userDefaults.array(forKey: "data") as! [Data]
            }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.configureObserver()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.removeObserver() // Notificationを画面が消えるときに削除
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { //キーボードを閉じる
        if (self.textView.isFirstResponder) {
            self.textView.resignFirstResponder()
        }
    }
    
    // Notificationを設定
    func configureObserver() {
        
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    // Notificationを削除
    func removeObserver() {
        
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    // キーボードが現れた時に、画面全体をずらす。
    @objc func keyboardWillShow(notification: Notification?) {
        
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
            self.view.transform = transform
            
        })
    }
    
    // キーボードが消えたときに、画面を戻す
    @objc func keyboardWillHide(notification: Notification?) {
        
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    
    @IBAction func tappedsavebtn() { //saveボタンを押したとき
        
        
        
        let data = self.image.jpegData(compressionQuality: 1.0)! //データ型に変換
        
        dataArray.append(data)//データ型の配列にデータ型に変換したUIImageを追加
        userDefaults.set(dataArray,forKey: "data") //dataArrayをuserDefaultsをに保存
        textArray.append(textView.text) //配列にテキストを一旦格納 / 配列追加
        userDefaults.set(textArray,forKey: "text")
        print("保存完了")
        
        
    }

}

    
    
    
    

