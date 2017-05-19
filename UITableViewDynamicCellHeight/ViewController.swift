//
//  ViewController.swift
//  UITableViewDynamicCellHeight
//
//  Created by Ke Ma on 18/05/2017.
//  Copyright © 2017 Ke Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
  // MARK: - Public Variables
  
  // MARK: - Private Variables
  fileprivate let CellID = "CellID"
  fileprivate let booksList = Book.bookLists()
  fileprivate let tableView = UITableView()
  
  // MARK: - IBOutlets
  
  // MARK: - Helpers
  func addTableView()
  {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    self.view.addSubview(tableView)
    
    let viewMarginGuide = self.view.layoutMarginsGuide
    tableView.topAnchor.constraint(equalTo: viewMarginGuide.topAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: viewMarginGuide.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: viewMarginGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: viewMarginGuide.trailingAnchor).isActive = true
    
  }
  
  func configTableView()
  {
    tableView.dataSource = self
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.register(CustomCell.self, forCellReuseIdentifier: CellID)
    
  }
  func setup()
  {
    self.title = "Books"
    self.view.backgroundColor = .white
    addTableView()
    configTableView()
  }
  
  // MARK: - View Life Cycle
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setup()
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

// extension
extension ViewController: UITableViewDataSource
{
  // MARK: - UITableViewDataSource Methods
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return booksList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! CustomCell
    let book = booksList[indexPath.row]
    cell.nameLabel.text = book.name
    cell.detailLabel.text = book.details
    return cell
  }
  
}

