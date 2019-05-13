//
//  listTableViewCell.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/05/07.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit

class listTableViewCell: UITableViewCell {
    
     @IBOutlet var photo: UIImageView!
     @IBOutlet var documents: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    
    
}
//// 重い処理をバックグラウンドで処理する
//DispatchQueue.global().async {
//
//    // NSDataをUIImageに変換
//    let photo = UIImage(data: imageData as! Data)
//
//    // 画面の更新はメインスレッドで行う
//    DispatchQueue.main.async {
//
//        // 表示するUIImageViewは非表示にする
//        self.UIImageView.alpha = 0.0
//
//        // 画像をセットする
//        self.photo.image = UIImage
//
//        // 画像の準備が完了したらUIImageViewを表示する
//        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {() -> Void in
//            self.myImageView.alpha  = 1.0
//        }, completion: {(finished: Bool) -> Void in
//        })
//    }
//}
