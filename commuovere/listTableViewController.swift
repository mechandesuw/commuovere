//
//  listTableViewController.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/05/07.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit



class listTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { // インスタンス化
    @IBOutlet var myTableView1: UITableView!
    var userDefaults = UserDefaults.standard
  
    
    var textArray: [String] = []
//        "1番めのセル","2番めのセル",
//        "3番めのセルは長い文字列を設定して、\nセルの高さが自動的に調節されるようになるかを確認しようと思います。",
//        "4番目のセル","5番目のセル","6番目のセル","7番目のセル"]
    
    var dataArray: [Data] = [] //Date型配列宣言

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        myTableView1.delegate = self
        myTableView1.dataSource = self
        
        //TableviewhからたtableviewCellを使えるようにする
        myTableView1.register(UINib(nibName: "listTableViewCell", bundle: nil),
                              forCellReuseIdentifier: "cell")
        
        
        print("text");
       // print(userDefaults.array(forKey: "text") )
        
        if (userDefaults.array(forKey: "text") != nil) {
            print("ある")
            textArray = userDefaults.array(forKey: "text") as! [String]
            
        } else {
            print("ない")
        }
        if (userDefaults.array(forKey: "data") != nil) {
            print("ある")
            dataArray = userDefaults.array(forKey: "data") as! [Data]
            
        }else{
            print("ない")
            
        }

    }

    //④セクション数を指定
    func numberOfSections(in tableView: UITableView) -> Int {
        //print("セクション数：1")
        return 1
    }
    //④セクションタイトルを指定
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "第\(section)セクション"
    //    }
    //④セル数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    //④セルを生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("セルの値を入れていく")
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
//                                   reuseIdentifier: "aaa\(indexPath.section)-\(indexPath.row)")
//        cell.textLabel?.text = UserDefaults.standard.string(forKey: "text")
        
        let cell = myTableView1.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! listTableViewCell
        
        //cell.detailTextLabel?.text = "行番号 : \(indexPath.row)"
        //cell.detailTextLabel?.numberOfLines = 0
        //cell.detailTextLabel?.text = textArray[indexPath.row] //INt型のどんどん増えていく整数が入っている
        cell.documents.text = textArray[indexPath.row]
        let image = UIImage(data:dataArray[indexPath.row]) //imagiにData型に保存したものを入れてる
        
        // 縦横比を維持したままImageViewに収まるように縮小する設定
        cell.imageView!.contentMode = .scaleAspectFit
        
        //cell.imageView?.image = image
        cell.photo.image = image!
        //        cell.imageView?.image = UIImage(named: "confirmPhotoView.image")
        
        
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        tableView.estimatedRowHeight = 300
//        return
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        // Dispose of any resources that can be recreated.
        
      
    }
    
    

}


