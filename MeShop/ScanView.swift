//
//  ScanView.swift
//  MeShop
//
//  Created by hyuma on 2016/12/16.
//  Copyright © 2016年 hyuma. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

protocol ScanViewDelegate : NSObjectProtocol{
    func alert()
}

class ScanView : UIView,AVCaptureMetadataOutputObjectsDelegate {
    var delegate : ScanViewDelegate?
    var myVideoInput : AVCaptureInput!
    var type = UILabel(frame: CGRectMake(0, 0, 200, 30))
    var value = UILabel(frame: CGRectMake(0, 0, 200, 30))
    var mySession: AVCaptureSession! = AVCaptureSession()
    
    required init() {
        super.init(frame: CGRectMake(0, 0, 0, 0))
        type.layer.position = CGPointMake(100, 100)
        value.layer.position = CGPointMake(100, 150)
        self.backgroundColor = .whiteColor()
        // セッションの作成.
        
        
        // デバイス一覧の取得.
        let devices = AVCaptureDevice.devices()
        
        // デバイスを格納する.
        var myDevice: AVCaptureDevice!
        
        // バックカメラをmyDeviceに格納.
        for device in devices{
            if(device.position == AVCaptureDevicePosition.Back){
                myDevice = device as! AVCaptureDevice
            }
        }
        
        // バックカメラから入力(Input)を取得.
        let myVideoInput = try! AVCaptureDeviceInput.init(device: myDevice)
        //let myVideoInput = AVCaptureDeviceInput.deviceInputWithDevice(myDevice, error: nil) as! AVCaptureDeviceInput
        
        if mySession.canAddInput(myVideoInput) {
            // セッションに追加.
            mySession.addInput(myVideoInput)
        }
        
        // 出力(Output)をMeta情報に.
        let myMetadataOutput: AVCaptureMetadataOutput! = AVCaptureMetadataOutput()
        
        if mySession.canAddOutput(myMetadataOutput) {
            // セッションに追加.
            mySession.addOutput(myMetadataOutput)
            // Meta情報を取得した際のDelegateを設定.
            myMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            // 判定するMeta情報にQRCodeを設定.
            myMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        }
        
        // 画像を表示するレイヤーを生成.
        let myVideoLayer = AVCaptureVideoPreviewLayer.init(session: mySession)
        myVideoLayer.frame = CGRectMake(0, 0, 500, 500 )
        myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        // Viewに追加.
        self.layer.addSublayer(myVideoLayer)
        self.addSubview(type)
        self.addSubview(value)
        
        // セッション開始.
        mySession.startRunning()
        
    }
    
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        if metadataObjects.count > 0 {
            let qrData: AVMetadataMachineReadableCodeObject  = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            print("\(qrData.type)")
            print("\(qrData.stringValue)")
            type.text = "type : " + qrData.type
            value.text = "value : " + qrData.stringValue
            mySession.stopRunning()
            self.delegate?.alert()
                        
            // SafariでURLを表示.
            //UIApplication.sharedApplication().openURL(NSURL(string: qrData.stringValue)!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}