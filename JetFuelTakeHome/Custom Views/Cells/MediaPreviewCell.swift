//
//  MediaPreviewCell.swift
//  JetFuelTakeHome
//
//  Created by Vanessa Flores on 12/15/20.
//

import UIKit

class MediaPreviewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    var coverPhotoImageView = CoverPhotoImageView(frame: .zero)
    var playButton = JFButton(image: SFSymbols.play!, roundedCorners: [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner])
    var copyLinkButton = JFButton(image: SFSymbols.link!, roundedCorners: [.layerMinXMinYCorner, .layerMinXMaxYCorner])
    var downloadButton = JFButton(image: SFSymbols.download!, roundedCorners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
    
    // MARK: - Properties
    
    static let reuseId = "MediaPreviewCell"
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure UI
    
    private func configure() {
        configureCoverPhotoImageView()
        configurePlayButton()
        configureCopyLinkButton()
        configureDownloadButton()
    }
    
    private func configureCoverPhotoImageView() {
        addSubview(coverPhotoImageView)
        coverPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coverPhotoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            coverPhotoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            coverPhotoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            coverPhotoImageView.widthAnchor.constraint(equalToConstant: 110),
            coverPhotoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configurePlayButton() {
        addSubview(playButton)
        playButton.tintColor = .white
        playButton.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: coverPhotoImageView.centerYAnchor),
            playButton.centerXAnchor.constraint(equalTo: coverPhotoImageView.centerXAnchor)
        ])
    }
    
    private func configureCopyLinkButton() {
        addSubview(copyLinkButton)
        copyLinkButton.setBorder()
        copyLinkButton.tintColor = .systemGray
        
        NSLayoutConstraint.activate([
            copyLinkButton.topAnchor.constraint(equalTo: coverPhotoImageView.bottomAnchor, constant: 6),
            copyLinkButton.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    private func configureDownloadButton() {
        addSubview(downloadButton)
        downloadButton.setBorder()
        downloadButton.tintColor = .systemGray

        NSLayoutConstraint.activate([
            downloadButton.topAnchor.constraint(equalTo: coverPhotoImageView.bottomAnchor, constant: 6),
            downloadButton.leadingAnchor.constraint(equalTo: copyLinkButton.trailingAnchor, constant: -1),
            downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    // MARK: - Helpers
    
    func set(_ mediaItem: MediaItem) {
        coverPhotoImageView.setImage(fromURL: mediaItem.coverPhotoUrl ?? "")
    }
}
