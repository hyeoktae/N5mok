//
//  PlayGameVC.swift
//  N5mok
//
//  Created by Alex Lee on 22/05/2019.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//
import UIKit
class PlayGameVC: UIViewController {
    
    let omokCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var layoutState = true
    
    let timerMessageLabel = UILabel()
    let timerLabel = UILabel()
    
    let backgroundViewofP1 = UIView()
    let backgroundViewofP2 = UIView()
    
    let imageViewOfP1 = UIImageView()
    let imageViewOfP2 = UIImageView()
    
    let nameLabelOfP1 = UILabel()
    let nameLabelOfP2 = UILabel()
    
    let centerBackgroundView = UIView()
    
    var timer = Timer()
    var timeValue = 61
    
    var viewBottomSafeInset: CGFloat = 1
    
    var otherPartyName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(omokCollectionView)
        omokCollectionView.frame = view.frame
        omokCollectionView.delegate = self
        omokCollectionView.dataSource = self
        omokCollectionView.backgroundColor = .white
        omokCollectionView.isScrollEnabled = false
        
        omokCollectionView.register(ChatRoomCell.self, forCellWithReuseIdentifier: "chatRoomCell")
        omokCollectionView.register(OmokGameCell.self, forCellWithReuseIdentifier: "omokGameCell")
        
        setAutoLayout()
        configure()
        
        // 현재 화면이 뜨자마자 실행
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerDispatchQueue(timer:)), userInfo: nil, repeats: true)
        
        print("⭐️⭐️⭐️ otherPartyName: ", otherPartyName)
    }
    
    @objc func timerDispatchQueue(timer: Timer) {
        timeValue -= 1
        var minute = String(timeValue / 60).count == 1 ? "0\(timeValue/60)" : String(timeValue/60)
        var second = String(timeValue % 60).count == 1 ? "0\(timeValue%60)" : String(timeValue%60)
        
        self.timerLabel.text = "\(minute):\(second)"
        
        
        if timeValue == 0 {
            timer.invalidate()
            print("--------------------------[Timer 종료]--------------------------")
        }
        
    }
    
    
    func setAutoLayout() {
        let safeGuide = view.safeAreaLayoutGuide
        
        view.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 40).isActive = true
//        timerLabel.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 30).isActive = true
//        timerLabel.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30).isActive = true
        timerLabel.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
        timerLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(timerMessageLabel)
        timerMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        timerMessageLabel.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 10).isActive = true
//        timerMessageLabel.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 30).isActive = true
//        timerMessageLabel.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30).isActive = true
        timerMessageLabel.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
        timerMessageLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(backgroundViewofP1)
        backgroundViewofP1.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewofP1.widthAnchor.constraint(equalTo: safeGuide.widthAnchor, multiplier: 0.5).isActive = true
        backgroundViewofP1.heightAnchor.constraint(equalToConstant: 120).isActive = true
        backgroundViewofP1.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        backgroundViewofP1.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        
        view.addSubview(backgroundViewofP2)
        backgroundViewofP2.translatesAutoresizingMaskIntoConstraints = false
        backgroundViewofP2.widthAnchor.constraint(equalTo: safeGuide.widthAnchor, multiplier: 0.5).isActive = true
        backgroundViewofP2.heightAnchor.constraint(equalToConstant: 120).isActive = true
        backgroundViewofP2.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        backgroundViewofP2.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
        
        view.addSubview(imageViewOfP1)
        imageViewOfP1.translatesAutoresizingMaskIntoConstraints = false
        imageViewOfP1.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 10).isActive = true
        imageViewOfP1.centerYAnchor.constraint(equalTo: backgroundViewofP1.centerYAnchor, constant: -10).isActive = true
        imageViewOfP1.widthAnchor.constraint(equalTo: safeGuide.widthAnchor, multiplier: 0.2).isActive = true
        imageViewOfP1.heightAnchor.constraint(equalTo: imageViewOfP1.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(imageViewOfP2)
        imageViewOfP2.translatesAutoresizingMaskIntoConstraints = false
        imageViewOfP2.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -10).isActive = true
        imageViewOfP2.centerYAnchor.constraint(equalTo: backgroundViewofP1.centerYAnchor, constant: -10).isActive = true
        imageViewOfP2.widthAnchor.constraint(equalTo: safeGuide.widthAnchor, multiplier: 0.2).isActive = true
        imageViewOfP2.heightAnchor.constraint(equalTo: imageViewOfP2.widthAnchor, multiplier: 1).isActive = true
        
        view.addSubview(centerBackgroundView)
        centerBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        centerBackgroundView
        
        view.bringSubviewToFront(backgroundViewofP1)
        view.bringSubviewToFront(backgroundViewofP2)
    }
    
    func configure() {
        timerMessageLabel.textAlignment = .center
        timerMessageLabel.textColor = .black
        timerMessageLabel.font = UIFont.boldSystemFont(ofSize: 20)
        timerMessageLabel.text = "남은시간"
        
        timerLabel.textAlignment = .center
        timerLabel.textColor = .black
        timerLabel.font = UIFont.systemFont(ofSize: 18)
        timerLabel.text = ""
        
        imageViewOfP1.backgroundColor = .blue
        imageViewOfP2.backgroundColor = .red
        
        backgroundViewofP1.backgroundColor = #colorLiteral(red: 0.154732585, green: 0.1633420885, blue: 0.1552935243, alpha: 0.608197774)
//        backgroundViewofP2.backgroundColor = #colorLiteral(red: 0.154732585, green: 0.1633420885, blue: 0.1552935243, alpha: 0.0942048373)
        
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let safeGuide = view.safeAreaLayoutGuide
        
        if layoutState {
            let layout = omokCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            //            layout.itemSize = omokCollectionView.frame.size
            layout.scrollDirection = .horizontal
            
            omokCollectionView.translatesAutoresizingMaskIntoConstraints = false
            omokCollectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 120).isActive = true
            omokCollectionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
            omokCollectionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor).isActive = true
            omokCollectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
            
            viewBottomSafeInset = view.safeAreaInsets.bottom
        }
    }
    
    
    
    @objc func slideToChatCell(_ sender: UIButton) {
        let indexPath = IndexPath(row: 1, section: 0)
        omokCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
    }
    
    @objc func slideToOmokCell(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        omokCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
        
//        if let chatRoomCell = sender.superview?.superview?.superview as? ChatRoomCell {
//            chatRoomCell.inputTextView.resignFirstResponder()
//            print("⭐️⭐️⭐️ success ")
//        }
    }
}
extension PlayGameVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let omokRoomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "omokGameCell", for: indexPath) as! OmokGameCell
            omokRoomCell.scrollBtn.addTarget(self, action: #selector(slideToChatCell(_:)), for: .touchUpInside)
            self.view.endEditing(true)
            return omokRoomCell
        } else {
            let chatRoomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "chatRoomCell", for: indexPath) as! ChatRoomCell
            chatRoomCell.viewBottomSafeInset = self.viewBottomSafeInset // 전체 뷰의 바텀 세이프인셋을 cell에 알려주기 위함
            
            chatRoomCell.backBtn.addTarget(self, action: #selector(slideToOmokCell(_:)), for: .touchUpInside)
            
            
            return chatRoomCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let chatRoomCell = cell as? ChatRoomCell {
            chatRoomCell.inputTextView.resignFirstResponder()
        }
        print("⭐️⭐️⭐️ didEndDisplaying ")
    }
    
    
    
    
    
    
    
    
}
