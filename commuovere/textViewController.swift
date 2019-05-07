//
//  textViewController.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/05/07.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var testTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ビューを作成する。
        let testView = UIView()
        testView.frame.size.height = 60
        testView.backgroundColor = UIColor.blueColor()
        
        //閉じるボタンを作成する。
        let closeButton = UIButton()
        closeButton.setTitle("閉じる", forState:UIControlState.Normal)
        closeButton.backgroundColor = UIColor.redColor()
        closeButton.addTarget(self,action:"onClickCloseButton:", forControlEvents: .TouchUpInside)
        
        //ビューに閉じるボタンを追加する。
        testView.addSubview(closeButton)
        
        //Autoresizingの変換をオフにする。
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        //ボタンの幅の制約を追加する。
        testView.addConstraint(NSLayoutConstraint(
            item: closeButton,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Width,
            multiplier: 0.0,
            constant: 70))
        
        //ボタンの高さの制約を追加する。
        testView.addConstraint(NSLayoutConstraint(
            item: closeButton,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Height,
            multiplier: 0.0,
            constant: 50))
        
        //ボタンの右端とビューの右端を揃える制約を追加する。
        testView.addConstraint(NSLayoutConstraint(
            item: closeButton,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: testView,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: 0))
        
        //ボタンの上端とビューの上端を揃える制約を追加する。
        testView.addConstraint(NSLayoutConstraint(item: closeButton,
                                                  attribute: NSLayoutAttribute.Top,
                                                  relatedBy: NSLayoutRelation.Equal,
                                                  toItem: testView,
                                                  attribute: NSLayoutAttribute.Top,
                                                  multiplier: 1.0,
                                                  constant: 0))
        
        
        //キーボードにビューを追加する。
        testTextView.inputAccessoryView = testView
        
        //テキストビューのデリゲート先にこのインスタンスを設定する。
        testTextView.delegate = self
        
    }
    
    
    //閉じるボタンで呼び出されるメソッド
    func onClickCloseButton(sender: UIButton) {
        testTextView.resignFirstResponder()
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
