//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Марк Пушкарь on 11.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
   private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Dr.Gonzo"
        return label
   }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "roger")
        imageView.layer.cornerRadius = 100/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        button.setTitle("Show Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.roundCornersWithRadius(4, top: true, bottom: true, shadowEnabled: true)
        return button
    }()
    
    private let statusLabel: UILabel = {
       let statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Some status"
        return statusLabel
    }()
    
   /* override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileNameLabel)
        addSubview(imageView)
        addSubview(button)
        addSubview(statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(
            x: 16,
            y: 16,
            width: 100,
            height: 100
        )
        
        profileNameLabel.sizeToFit()
        profileNameLabel.frame = CGRect(
            x: imageView.frame.maxX + 20,
            y: 27,
            width: profileNameLabel.frame.width,
            height: profileNameLabel.frame.height
        )
        
        button.frame = CGRect(
            x: 16,
            y: imageView.frame.maxY + 16,
            width: frame.maxX - 32,
            height: 50
        )
        
        statusLabel.sizeToFit()
        statusLabel.frame = CGRect(
            x: imageView.frame.maxX + 20,
            y: button.frame.minY - 34,
            width: statusLabel.frame.width,
            height: statusLabel.frame.height
        )
    }
    
    @objc private func ButtonTapped() {
        print(statusLabel.text!)
    }
}

    extension UIView {
        
        func roundCornersWithRadius(_ radius: CGFloat, top: Bool? = true, bottom: Bool? = true, shadowEnabled: Bool = true) {
            var maskedCorners = CACornerMask()
            
            if shadowEnabled {
                clipsToBounds = true
                layer.masksToBounds = false
                layer.shadowOpacity = 0.7
                layer.shadowColor = UIColor(white: 0.0, alpha: 1.0).cgColor
                layer.shadowRadius = 4
                layer.shadowOffset = CGSize(width: 4, height: 4)
            }
            
            switch (top, bottom) {
            case (true, false):
                maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            case (false, true):
                maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            case (true, true):
                maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            default:
                break
            }
            
            layer.cornerRadius = radius
            layer.maskedCorners = maskedCorners
        }
}


 
