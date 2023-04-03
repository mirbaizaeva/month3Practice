//
//  CollectionViewCell.swift
//  month3Practice
//
//  Created by Nurjamal Mirbaizaeva on 3/4/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var collection: [Collection] = []
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initDate()
        addSubview(label)
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 10
        label.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(25)
            make.height.equalTo(35)
            make.width.equalTo(114)
        }
    }
        func initDate(){
            collection = [Collection(name: "ghgh"), Collection(name: "ghgh"), Collection(name: "ghgh"), Collection(name: "ghgh")]
        }
    func setup(name: Collection){
        self.label.text = name.name
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
struct Collection{
    var name: String
}
