//
//  textViewController.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/05/07.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit


class TextViewController: UIViewController, UITextViewDelegate, UIScrollViewDelegate{
    
    let TextView: UITextField = UITextField()
    var scrollView = UIScrollView()
//    //スクロールするための処理
//    let sc = UIScrollView();
//    var txtActiveField = UITextView()
//
    var userDefaults = UserDefaults.standard


    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var confirmPhotoView: UIImageView!
  
    //画像を受け取るためのプロパティ
    var image: UIImage!
    
    //文字を格納する配列
    var textArray: [String] = []
    
    //Date型の配列を宣言
    
    var dataArray: [Data] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Notificationの発行
        self.configureObserver()
    }

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.textView.delegate = self
        self.scrollView.delegate = self
        
        self.scrollView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
            // textfieldにplaceholderを設置
        self.TextView.placeholder = "text field"
        // textfieldの枠を表示する.
        self.TextView.borderStyle = UITextField.BorderStyle.roundedRect
        
        // UITextFieldの表示する位置を設定する.
        self.textView.frame = CGRect(x: 13,y: 576,width: 388,height: 197)
        // scrollViewを設置
        self.scrollView.addSubview(self.TextView)
        
        self.view.addSubview(self.scrollView)
    
   
        //改行ボタンが押された際に呼ばれる/キーボードが閉じる
        func textviewShouldReturn(textField: UITextView) -> Bool {
            textField.resignFirstResponder()
            
            return true
        }
        
        let notification = NotificationCenter.default
        
        // Notificationを設定
        /// Notification発行
        func configureObserver() {
            let notification = NotificationCenter.default
            notification.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                     name: UIResponder.keyboardWillShowNotification, object: nil)
            notification.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                     name: UIResponder.keyboardWillHideNotification, object: nil)
            print("Notificationを発行")
        }

    // Notificationを削除
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    // キーボードが現れたときにviewをずらす
        func keyboardWillShow(notification: Notification?) {
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
        }
    }
    
    // キーボードが消えたときにviewを戻す
        func keyboardWillHide(notification: Notification?) {
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            self.view.transform = CGAffineTransform.identity
        }
    }

    

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
    
    
    
    @IBAction func tappedsavebtn() { //saveボタンを押したとき
        
        
        
        let data = self.image.pngData()! //データ型に変換
        
        dataArray.append(data)//データ型の配列にデータ型に変換したUIImageを追加
        userDefaults.set(dataArray,forKey: "data") //dataArrayをuserDefaultsをに保存
        textArray.append(textView.text) //配列にテキストを一旦格納 / 配列追加
        userDefaults.set(textArray,forKey: "text")
        print("保存完了")
        
        
    }

}

    
    
    
    

