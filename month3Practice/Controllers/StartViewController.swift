//
//  StartViewController.swift
//  month3Practice
//
//  Created by Nurjamal Mirbaizaeva on 2/4/23.
//

import UIKit
import SnapKit

class StartViewController: UIViewController, UITableViewDelegate {

    private var detailList: [Detail] = []
    private var filteredDetail: [Detail] = []
    private var isFiltering = false

    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let helloLabel = UILabel()
    private let welcomeLabel = UILabel()
    private let imageView = UIImageView()
    private let imageViewVector = UIImageView()
    var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        layout.itemSize = CGSize(width: 100, height: 160)
        layout.scrollDirection = .horizontal
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vc.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initDate()
    }
    private func initUI(){
        navigationItem.titleView = searchBar
        view.backgroundColor = .white
        searchBar.placeholder = "Search"
        
        helloLabel.text = "Hello Mehrab"
        helloLabel.textColor = .lightGray
        helloLabel.font = .boldSystemFont(ofSize: 18)
        
        welcomeLabel.text = "Welcome Back!"
        welcomeLabel.textColor = .black
        welcomeLabel.font = .boldSystemFont(ofSize: 32)
        
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .black
                
        imageViewVector.image = UIImage(named: "vector")
        
        tableView.backgroundColor = .white

        tableView.dataSource = self
        searchBar.delegate = self
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(tableView)
        view.addSubview(helloLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(searchBar)
        view.addSubview(imageView)
        view.addSubview(imageViewVector)
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(260)
            make.height.equalTo(35)
            make.width.equalTo(405)
        }
        helloLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(54)
            make.height.equalTo(21)
        }
        imageView.snp.makeConstraints{ make in
            make.leading.equalTo(helloLabel.snp.trailing).offset(220)
            make.top.equalToSuperview().offset(58)
            make.height.width.equalTo(25)
        }
        welcomeLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(helloLabel.snp.bottom).offset(10)
            make.height.equalTo(38)
            make.width.equalTo(229)
        }
        searchBar.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(160)
            make.height.equalTo(55)
            make.width.equalTo(302)
        }
        imageViewVector.snp.makeConstraints{ make in
            make.leading.equalTo(searchBar.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(160)
            make.height.width.equalTo(55)
        }
        tableView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(350)
            make.bottom.equalToSuperview()
        }
    }
    private func initDate(){
        detailList = [Detail(imageView: "pizza1", nameView: "Pizza with Mushrooms", labelView: "14-20 minutes", priceView: "$12"), Detail(imageView: "pizza2", nameView: "Pepperoni Cheese Pizza", labelView: "18-25 minutes", priceView: "$14")]
    }
}
extension StartViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        return cell
    }
}

extension StartViewController: UITableViewDataSource, UITextViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        isFiltering ? filteredDetail.count : detailList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.setData(name: detailList[indexPath.row].nameView, image: detailList[indexPath.row].imageView, time: detailList[indexPath.row].labelView, price: detailList[indexPath.row].priceView)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let vc = DetailViewController()
        vc.titleNameChangec = detailList[indexPath.row].nameView
        vc.pizzas(image: detailList[indexPath.row].imageView)
        vc.priceChange = detailList[indexPath.row].priceView
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension StartViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{

        }else{
            isFiltering = true
            filteredDetail = detailList.filter({ $0.nameView.lowercased().contains(searchText.lowercased())})
        }
        tableView.reloadData()
    }
}
