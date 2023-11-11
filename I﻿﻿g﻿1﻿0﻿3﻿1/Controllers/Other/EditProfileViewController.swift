//
//  EditProfileViewController.swift
//  I﻿﻿g﻿1﻿0﻿3﻿1
//
//  Created by 維衣 on 2023/11/1.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    let placeholder: String
    var value: String?
}

final class EditProfileViewController: UIViewController, UITableViewDataSource {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView
    }()
    
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModel()
        tableView.tableHeaderView = createTableHeaderView()
        tableView.dataSource = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        navigationItem.leftBarButtonItems = [cancelButton]
        navigationItem.rightBarButtonItems = [saveButton]
        
//        navigationItem.rightBarButtonItems = [saveButton, cancelButton]
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        
        
        
        // ﻿正確註冊 cell
        
    }
    
    private func configureModel() {
        // name, username, website, bio
        let section1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        // email, phone, gender
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section2.append(model)
        }
        models.append(section2)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Tableview
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral)
        let size = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width - size)/2, y: (header.height - size)/2, width: size, height: size))
        
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    @objc func didTapProfileButton() {
        
    }
    
    @objc private func didTapProfilePhotoButton() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count // ﻿返回﻿﻿ tableView ﻿的﻿儲存格數量
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
//        cell.textLabel?.text = model.label
        cell.configure(with: model)
//        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        guard section == 1 else {
//            return nil
//        }
//        return "Private Information"
//    }
    
    
    // MARK: - Action
    @objc private func didTapSave() {
        // Save info to database
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Lirbrary", style: .default, handler: { _ in
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
}

extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewcell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel?) {
//        print("Field updated to : \(value ?? "nil")")
        // Updata the model
//        updatedModel?.label
//        print(updatedModel.value ?? "nil")
    }
    
    
}
