//
//  ViewController.swift
//  SwiftLearnDemo
//
//  Created by donglingxiao on 2018/10/10.
//  Copyright © 2018年 donglingxiao. All rights reserved.
//

import UIKit
let ScreenWidth  = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    fileprivate let dateSource :[String]! = ["CollectionView","ScrollView"]
    fileprivate let controller :[UIViewController] = [CollectionViewDemo(),ScrollViewDemo()]
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: ScreenWidth, height: ScreenHeight - 80))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpUI()
    }
    
    
    func setUpUI() {
        self.view.backgroundColor = UIColor.white
//        self.addButton()
        self.view.addSubview(tableView)
    }
    
    
    func addButton() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = self.view.center
        button.backgroundColor = .red
        button.setTitle("click on!", for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action:#selector(buttonClicked(button:)) , for: .touchUpInside)
        
    }
    @objc func buttonClicked(button:UIButton) {
        button.isSelected = !button.isSelected
        if button.isSelected {
            print("select")
        }else{
            print("unselect")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateSource.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dateSource[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.navigationController?.pushViewController(controller[indexPath.row], animated: false)
        
        
    }
}

