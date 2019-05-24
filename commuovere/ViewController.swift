//
//  ViewController.swift
//  commuovere
//
//  Created by 山谷美咲生 on 2019/04/27.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit
import AVFoundation
import Photos


//extension UIViewController:AVCapturePhotoCaptureDelegate {
//
//    //映像をキャプチャする
//    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        //データを取り出す
//        guard let photoData = photo.fileDataRepresentation() else {
//            return
//        }
//        //Dataから写真イメージを作る
//        if let stillImage = UIImage(data: photoData) {
//            //移動先のビューコントローラーを参照する
//            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "preview")as! ViewController
//            nextVC.image = stillImage
//            //シーンを移動する
//            present(nextVC, animated: true, completion: nil)
//        }
//    }
//}

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    
    //ラベルとimage viewにつなぐ
    @IBOutlet var cameraView : UIImageView!
    @IBOutlet var label : UILabel!
    var image: UIImage!
    var previewLayer: AVCaptureVideoPreviewLayer!
//    // インスタンスの作成
//    var session = AVCaptureSession()
//    var photoOutputObj = AVCapturePhotoOutput()
//    // 通知センターを作る
//    let notification = NotificationCenter.default
//    // プライバシーと入出力のステータス
//    var authStatus:AuthorizedStatus = .authorized
//    var inOutStatus: InputOutputStatus = .ready
//    // 認証のステータス
//    enum AuthorizedStatus {
//        case authorized
//        case notAuthorized
//        case failed
//    }
//    // 入出力のステータス
//    enum InputOutputStatus {
//        case ready
//        case notReady
//        case failed
//    }
//    //section毎の画像配列
//    //let imgArray:
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //文字表示
        label.text = "Tap the [Start] to take a picture"
    }
    
    // カメラの撮影開始
    @IBAction func startCamera(_ sender : AnyObject) {
        
        let sourceType:UIImagePickerController.SourceType =
        UIImagePickerController.SourceType.camera
        
        
        
        
        //カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            //インスタンスの作成
            let cameraPicker = UIImagePickerController()
            let pickerController = UIImagePickerController()
            
             //これがあると撮影後に編集ができる
            pickerController.delegate = self
           
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            pickerController.sourceType = UIImagePickerController.SourceType.camera
            self.present(pickerController,animated:true,completion:nil)
            
        }
        else{
            label.text = "error"
            
        }
    }
    //向きがおかしくなる時用
    func resizeMaintainDirection(size:CGSize) -> UIImage?{
        
        // リサイズ処理
        let origWidth = image.size.width
        let origHeight = image.size.height
        
        var resizeWidth:CGFloat = 0
        var resizeHeight:CGFloat = 0
        if (origWidth < origHeight) {
            resizeWidth = size.width
            resizeHeight = origHeight * resizeWidth / origWidth
        } else {
            resizeHeight = size.height
            resizeWidth = origWidth * resizeHeight / origHeight
        }
        
        let resizeSize = CGSize(width:resizeWidth, height:resizeHeight)
        UIGraphicsBeginImageContext(resizeSize)
        
        image.draw(in: CGRect(x:0,y: 0,width: resizeWidth, height: resizeHeight))
        
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        if let cropRef = resizeImage?.cgImage {
            cropRef.cropping(to: cropRef as! CGRect)
            let cropImage = UIImage(cgImage: cropRef)
            return cropImage
        }else {
            print("error!")
            return nil
        }
        
        
        
        
    }

    
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        

        
        if let pickedImage = info[.originalImage]
            as? UIImage {

            
            cameraView.contentMode = .scaleAspectFit
            cameraView.image = pickedImage
            
            
            
        }
        
        
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
        label.text = "Tap the [Save] to save a picture"
        
    }
    
    func imagePickerController(picker:UIImagePickerController!, didFinishPickingImage image:UIImage!,editingInfo:[NSObject : AnyObject]!){

        let resizeImage = UIImage()
        //resizeImage = resizeCamera(image, width:Int(screenWidth) * 2, height: Int(screenHeight) * 2)

//        let screenWidth: CGFloat = UIScreen.main.bounds.width      //画面の幅
//        let screenHeight: CGFloat = UIScreen.main.bounds.height    //画面の高さ
//
       // size(image, width:Int(screenWidth) * 2, height: Int(screenHeight) * 2)
        //適当に用意したUIImageViewにのせています
        cameraView.image = resizeImage
        self.dismiss(animated: true,completion:nil)
    }
    
   
    
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        label.text = "Canceled"
        
    }
    
    
    

    
    // 写真を保存
    @IBAction func savePicture(_ sender : AnyObject) {
        image = cameraView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(
                image,
                self,
                #selector(ViewController.image(_:didFinishSavingWithError:contextInfo:)),
                nil)
            //写真confirm画像遷移
         //  self.performSegue(withIdentifier: "PhotoConfirm", sender: self)
            
        }
        else{
            label.text = "image Failed !"
        }
        
    }

    
    // 書き込み完了結果の受け取り
    @objc func image(_ image: UIImage,
                     didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {
        
        if error != nil {
            print(error.code)
            label.text = "Save Failed !"
        }
        else{
            label.text = "Save Succeeded"
        }
    }
    
    
    
    
    
    // アルバムを表示
    @IBAction func showAlbum(_ sender : AnyObject) {
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            label.text = "Tap the [Start] to save a picture"
        }
        else{
            label.text = "error"
            
        }
        
    }
    
    @IBAction func tappedDonebtn(_ sender: TextViewController) {
        self.performSegue(withIdentifier: "PhotoConfirm", sender: self.image)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoConfirm" {
            let photoConfirm: TextViewController = segue.destination as! TextViewController

            photoConfirm.image = self.image
        }

    }
    




    }

