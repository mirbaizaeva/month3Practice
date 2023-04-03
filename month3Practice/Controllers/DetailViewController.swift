//
//  DetailViewController.swift
//  month3Practice
//
//  Created by Nurjamal Mirbaizaeva on 2/4/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleNameChangec: String?
    var priceChange: String?
    
    let detail: UILabel = {
        let label = UILabel()
        label.text = "Detail"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 23)
        return label
    }()

    let titleName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let imagePizza = UIImageView()
    
    let buttonHeart: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = 10
        return button
    }()
     
        let chooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose the size"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()

    let label: UILabel = {
        let label = UILabel()
        label.text = "-      01      +"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 22)
        label.layer.cornerRadius = 22
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 1
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.textColor = .lightGray
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()

    let price: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()

    let buttonAdd: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = .orange
        button.tintColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
    
            initUI()
            initAction()
            view.backgroundColor = .white
        }
     func pizzas(image: String){
        imagePizza.image = UIImage(named: image)
    }
        private func initUI(){
    
        view.addSubview(detail)
        view.addSubview(titleName)
        titleName.text = titleNameChangec
        view.addSubview(imagePizza)
        view.addSubview(buttonHeart)
        view.addSubview(chooseLabel)
        view.addSubview(label)
        view.addSubview(priceLabel)
        view.addSubview(price)
        price.text = priceChange
        view.addSubview(buttonAdd)
        
        detail.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(170)
            make.top.equalToSuperview().offset(60)
            make.height.equalTo(31)
        }
        titleName.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(100)
            make.top.equalTo(detail.snp.bottom).offset(30)
            make.height.equalTo(98)
        }
        buttonHeart.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(52)
            make.height.width.equalTo(45)
        }
        imagePizza.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(67)
            make.top.equalTo(titleName.snp.bottom).offset(35)
            make.height.equalTo(229)
        }
        chooseLabel.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(100)
            make.top.equalTo(imagePizza.snp.bottom).offset(30)
            make.height.equalTo(26)
        }
        label.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(97)
            make.top.equalTo(chooseLabel.snp.bottom).offset(30)
            make.height.equalTo(70)
        }
        priceLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(26)
            make.top.equalTo(label.snp.bottom).offset(50)
            make.width.equalTo(35)
            make.height.equalTo(16)
        }
        price.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(26)
            make.top.equalTo(priceLabel.snp.bottom).offset(0)
            make.height.equalTo(28)
            make.width.equalTo(83)
        }
        buttonAdd.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(label.snp.bottom).offset(50)
            make.height.equalTo(61)
            make.width.equalTo(176)
        }
    }
    private func initAction(){
        buttonHeart.addTarget(self, action: #selector(coloring(_:)), for: .touchUpInside)
    }
    var changecClor = true
    @objc func coloring(_ sender: Any){
        if changecClor{
            buttonHeart.setImage(UIImage(systemName: "heart"), for:.normal)
        }else{
            buttonHeart.setImage(UIImage(systemName: "heart.fill"), for:.normal)
            buttonHeart.tintColor = .red
            changecClor = false
        }
        changecClor = !changecClor
    }
}
