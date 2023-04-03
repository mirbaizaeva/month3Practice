//
//  TableViewCell.swift
//  month3Practice
//
//  Created by Nurjamal Mirbaizaeva on 2/4/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    public let imageBg = UIImageView()
    
    private let timeLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .systemGreen
        return label
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "+"
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
         return label
    }()
    
    private let imageTime: UIImageView = {
        let image = UIImageView()
        image.tintColor = .gray
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bgView)
        
        bgView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(24)
            make.height.equalTo(184)
            make.width.equalTo(382)
        }
        bgView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-21)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(68)
            make.width.equalTo(171)
        }
        bgView.addSubview(imageBg)
        imageBg.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-179)
            make.leading.equalToSuperview().offset(0)
            make.top.bottom.equalToSuperview()
            make.height.equalTo(184)
            make.width.equalTo(203)
        }
        bgView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-87)
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.height.equalTo(14)
        }
        bgView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-150)
            make.top.equalTo(timeLabel.snp.bottom).offset(20)
            make.height.equalTo(29)
        }
        bgView.addSubview(label)
        label.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-21)
            make.bottom.equalToSuperview().offset(-21)
            make.height.width.equalTo(30)
        }
        bgView.addSubview(imageTime)
        imageTime.snp.makeConstraints { make in
            make.trailing.equalTo(timeLabel.snp.leading).offset(-1)
            make.top.equalTo(nameLabel.snp.bottom).offset(16)
            make.height.width.equalTo(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setData(name: String, image: String, time: String, price: String){
        nameLabel.text = name
        imageBg.image = UIImage(named: image)
        timeLabel.text = time
        priceLabel.text = price
        imageTime.image = UIImage(systemName: "alarm")
    }
}
