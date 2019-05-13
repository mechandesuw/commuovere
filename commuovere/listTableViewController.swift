//
//  listTableViewController.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/05/07.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit


//    var textArray: [String] = []  //読み取ったものを入れるための宣言
//
//    var myTableView: UITableView!
//
//    var image: UIImage? = nil
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        if userDefaults.array(forKey: "text") != nil {
//            textArray = userDefaults.array(forKey: "text") as! [String]
//
//        }
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//
//        if userDefaults.array(forKey: "text") != nil {
//            textArray = userDefaults.array(forKey: "text") as! [String]
//        }
//    }
//
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
//
//
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//"1番めのセル","2番めのセル",
//"3番めのセルは長い文字列を設定して、\nセルの高さが自動的に調節されるようになるかを確認しようと思います。",
//"4番目のセル","5番目のセル","6番目のセル","7番目のセル"

//
//}
class listTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //ViewControllerにデリケートメソッドを２個記述

    var TableView: UITableView! //TableViewのインスタンスを生成
    var userDefaults = UserDefaults.standard //userDefaultsを使うための変数

    var textArray: [String] = []
    
    let saveDate = UserDefaults.standard
    
   // UserDefaults.standard.array(forKey: .text)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // TableView = UITableView(frame: self.view.frame, style: UITableView.Style.grouped) // ‥②
        
        TableView.delegate = self // テーブルの表示に関することは(ViewControllerクラス)がやるよという宣言
        TableView.dataSource = self //テーブルの表示に関することは(ViewControllerクラス)がやるよ」という宣言
        TableView.estimatedRowHeight = 100
        TableView.rowHeight = UITableView.automaticDimension
        self.view.addSubview(TableView)
    }

    //④セクション数を指定
    func numberOfSections(in tableView: UITableView) -> Int {
        //print("セクション数：1")
        return 1
    }
    //④セルを生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //セルの型を作る
      //  print("セルの値を入れていく")
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default,
                                   reuseIdentifier: "cell")
       // cell.textView?.text = "セクション番号 : \(indexPath.section)"
        //cell.detailTextLabel?.text = "行番号 : \(indexPath.row)"
        //cell.detailTextLabel?.numberOfLines = 0
        cell.TextView?.text = textArray[indexPath.row]
        cell.imageView?.image = confirmPhotoView
        return cell
    }
    
//
//class listTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { // ‥①
//    var myTableView1: UITableView!
//    let textArray: [String] = [
//        "1番めのセル","2番めのセル",
//        "3番めのセルは長い文字列を設定して、\nセルの高さが自動的に調節されるようになるかを確認しようと思います。",
//        "4番目のセル","5番目のセル","6番目のセル","7番目のセル"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        myTableView1 = UITableView(frame: self.view.frame, style: UITableView.Style.grouped) // ‥②
//        myTableView1.delegate = self // ‥③
//        myTableView1.dataSource = self // ‥③
//        myTableView1.estimatedRowHeight = 100
//        myTableView1.rowHeight = UITableView.automaticDimension
//        self.view.addSubview(myTableView1)
//    }
//
//    //④セクション数を指定
//    func numberOfSections(in tableView: UITableView) -> Int {
//        //print("セクション数：1")
//        return 1
//    }
//    //④セクションタイトルを指定
//    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//    //        return "第\(section)セクション"
//    //    }
//    //④セル数を指定
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return textArray.count
//    }
//    //④セルを生成
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("セルの値を入れていく")
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle,
//                                   reuseIdentifier: "aaa\(indexPath.section)-\(indexPath.row)")
//        cell.textView?.text = "セクション番号 : \(indexPath.section)"
//        cell.detailTextLabel?.text = "行番号 : \(indexPath.row)"
//        //cell.detailTextLabel?.numberOfLines = 0
//        //cell.detailTextLabel?.text = textArry[indexPath.row]
//        cell.imageView?.image = UIImage(named: "dog2.png")
//        return cell
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
}
