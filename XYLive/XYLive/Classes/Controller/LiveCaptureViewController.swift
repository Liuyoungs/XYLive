//
//  LiveCaptureViewController.swift
//  XYLive
//
//  Created by xiyan on 2018/9/10.
//  Copyright © 2018年 xiyan. All rights reserved.
//

import UIKit

public let kScreenHeight = UIScreen.main.bounds.height
public let kScreenWidth = UIScreen.main.bounds.width

class LiveCaptureViewController: UIViewController, LFLiveSessionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session.delegate = self
        session.preView = self.view
        
        self.requestAccessForVideo()
        self.requestAccessForAudio()
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(containerView)
        containerView.addSubview(stateLabel)
        containerView.addSubview(closeButton)
        containerView.addSubview(beautyButton)
        containerView.addSubview(cameraButton)
        containerView.addSubview(startLiveButton)
        
        cameraButton.addTarget(self, action: #selector(didTappedCameraButton(_:)), for:.touchUpInside)
        beautyButton.addTarget(self, action: #selector(didTappedBeautyButton(_:)), for: .touchUpInside)
        startLiveButton.addTarget(self, action: #selector(didTappedStartLiveButton(_:)), for: .touchUpInside)
    }
    
    //MARK: 访问授权相关
    
    func requestAccessForVideo() -> Void {
        let status = AVCaptureDevice.authorizationStatus(for: .video);
        switch status  {
        // 许可对话没有出现，发起授权许可
        case AVAuthorizationStatus.notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted) in
                if(granted){
                    DispatchQueue.main.async {
                        self.session.running = true
                    }
                }
            })
            break;
        // 已经开启授权，可继续
        case AVAuthorizationStatus.authorized:
            session.running = true;
            break;
        // 用户明确地拒绝授权，或者相机设备无法访问
        case AVAuthorizationStatus.denied:
            print("无访问相机权限")
            break
        case AVAuthorizationStatus.restricted:
            print("访问相机请求已经被拒绝")
            break;
        default:
            break;
        }
    }
    
    func requestAccessForAudio() -> Void {
        let status = AVCaptureDevice.authorizationStatus(for:.audio)
        switch status  {
        // 许可对话没有出现，发起授权许可
        case AVAuthorizationStatus.notDetermined:
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: { (granted) in
                
            })
            break;
        // 已经开启授权，可继续
        case AVAuthorizationStatus.authorized:
            print("已授权")
            break;
        // 用户明确地拒绝授权，或者相机设备无法访问
        case AVAuthorizationStatus.denied:
            print("无访问相机权限")
            break
        case AVAuthorizationStatus.restricted:
            print("访问相机请求已经被拒绝")
            break;
        }
    }
    
    //MARK: - Callbacks
    
    // 回调
    func liveSession(_ session: LFLiveSession?, debugInfo: LFLiveDebug?) {
        print("debugInfo: \(debugInfo!.currentBandwidth)")
    }
    
    func liveSession(_ session: LFLiveSession?, errorCode: LFLiveSocketErrorCode) {
        print("errorCode: \(errorCode.rawValue)")
    }
    
    func liveSession(_ session: LFLiveSession?, liveStateDidChange state: LFLiveState) {
        print("liveStateDidChange: \(state.rawValue)")
        switch state {
        case LFLiveState.ready:
            stateLabel.text = "未连接"
            break;
        case LFLiveState.pending:
            stateLabel.text = "连接中"
            break;
        case LFLiveState.start:
            stateLabel.text = "已连接"
            break;
        case LFLiveState.error:
            stateLabel.text = "连接错误"
            break;
        case LFLiveState.stop:
            stateLabel.text = "未连接"
            break;
        default:
            break;
        }
    }
    
    //MARK: - Events
    
    // 开始直播
    @objc func didTappedStartLiveButton(_ button: UIButton) -> Void {
        startLiveButton.isSelected = !startLiveButton.isSelected;
        if (startLiveButton.isSelected) {
            startLiveButton.setTitle("结束直播", for: UIControl.State())
            let stream = LFLiveStreamInfo()
            stream.url = "rtmp://192.168.6.68:1935/hls/ios"
            session.startLive(stream)
        } else {
            startLiveButton.setTitle("开始直播", for: UIControl.State())
            session.stopLive()
        }
    }
    
    // 美颜
    @objc func didTappedBeautyButton(_ button: UIButton) -> Void {
        session.beautyFace = !session.beautyFace;
        beautyButton.isSelected = !session.beautyFace
    }
    
    // 摄像头
    @objc func didTappedCameraButton(_ button: UIButton) -> Void {
        let devicePositon = session.captureDevicePosition;
        session.captureDevicePosition = (devicePositon == .back) ? .front : .back;
    }
    
    // 关闭
    @objc func didTappedCloseButton(_ button: UIButton) -> Void  {
        startLiveButton.setTitle("开始直播", for: UIControl.State())
        session.stopLive()
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Getters and Setters
    
    //  默认分辨率368 ＊ 640  音频：44.1 iphone6以上48  双声道  方向竖屏
    var session: LFLiveSession = {
        let audioConfiguration = LFLiveAudioConfiguration.defaultConfiguration(for: LFLiveAudioQuality.high)
        let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: LFLiveVideoQuality.low3)
        let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
        return session!
    }()
    
    // MARK:- 视图
    var containerView: UIView = {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        containerView.backgroundColor = UIColor.clear
        containerView.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight, UIView.AutoresizingMask.flexibleHeight]
        return containerView
    }()
    
    // MARK:- 连接状态 label
    var stateLabel: UILabel = {
        let stateLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 80, height: 40))
        stateLabel.text = "未连接"
        stateLabel.textColor = UIColor.white
        stateLabel.font = UIFont.systemFont(ofSize: 14)
        return stateLabel
    }()
    
    // MARK:- 关闭按钮
    var closeButton: UIButton = {
        let closeButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 10 - 44, y: 20, width: 44, height: 44))
        closeButton.setImage(UIImage(named: "close_preview"), for: UIControl.State())
        closeButton.addTarget(self, action: #selector(didTappedCloseButton(_:)), for: .touchUpInside)
        return closeButton
    }()
    
     // MARK:- 摄像头
    var cameraButton: UIButton = {
        let cameraButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 54 * 2, y: 20, width: 44, height: 44))
        cameraButton.setImage(UIImage(named: "camra_preview"), for: .normal)
        return cameraButton
    }()
    
    // MARK:- 美颜按钮
    var beautyButton: UIButton = {
        let beautyButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 54 * 3, y: 20, width: 44, height: 44))
        beautyButton.setImage(UIImage(named: "camra_beauty"), for: .selected)
        beautyButton.setImage(UIImage(named: "camra_beauty_close"), for: .normal)
        return beautyButton
    }()
    
    // MARK:- 开始直播按钮
    var startLiveButton: UIButton = {
        let startLiveButton = UIButton(frame: CGRect(x: 30, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width - 10 - 44, height: 44))
        startLiveButton.layer.cornerRadius = 22
        startLiveButton.setTitleColor(UIColor.black, for: .normal)
        startLiveButton.setTitle("开始直播", for: .normal)
        startLiveButton.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        startLiveButton.backgroundColor = UIColor(red: 50, green: 32, blue: 245, alpha: 1)
        return startLiveButton
    }()
}
