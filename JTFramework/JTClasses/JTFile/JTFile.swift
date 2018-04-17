//
//  File.swift
//
//  Created by JT on 2018/4/11.
//  Copyright © 2018年 JT. All rights reserved.
//
import Foundation

public class JTFile {
    public static let shareInstance = JTFile()
    private init() {}
    private let fileManager = FileManager.default
    
    public lazy var documentString: String? = {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }()
    public lazy var documentURL: URL? = {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).last
    }()
    public lazy var cacheString: String? = {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    }()
    public lazy var tmpDir: String = {
        var x = NSTemporaryDirectory()
        if "/" == x.last {
            x.removeLast()
        }
        return x
    }()
    
    public func saveFile(url: URL, data: Data) -> Bool {
        let dir = url.deletingLastPathComponent()
        guard createDirectory(url: dir) else { return false }
        do {
            try data.write(to: url)
            return true
        }
        catch { return false }
    }
    public func createDirectory(path: String) -> Bool {
        var isDir = ObjCBool(true)
        if fileManager.fileExists(atPath: path, isDirectory: &isDir) { return true }
        do {
            try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            return true
        }
        catch { return false }
    }
    public func createDirectory(url: URL) -> Bool {
        var isDir = ObjCBool(true)
        if fileManager.fileExists(atPath: url.path, isDirectory: &isDir) { return true }
        do {
            try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            return true
        }
        catch { return false }
    }
    public func copyItem(from: URL, to: URL) -> Bool {
        guard fileManager.fileExists(atPath: from.path) && fileManager.isReadableFile(atPath: from.path) else { return false }
        do {
            try fileManager.copyItem(at: from, to: to)
            return true
        }
        catch { return false }
    }
    public func directoryExist(atPath: URL) -> Bool {
        var isDir = ObjCBool(true)
        return fileManager.fileExists(atPath: atPath.path, isDirectory: &isDir)
    }
    public func directoryExist(atPath: String) -> Bool {
        var isDir = ObjCBool(true)
        return fileManager.fileExists(atPath: atPath, isDirectory: &isDir)
    }
    public func fileExist(atPath: URL) -> Bool {
        return fileManager.fileExists(atPath: atPath.path)
    }
    public func fileExist(atPath: String) -> Bool {
        return fileManager.fileExists(atPath: atPath)
    }
    public func deleteFile(url: URL) -> Bool {
        if !fileExist(atPath: url) { return true }
        if !fileManager.isDeletableFile(atPath: url.path) { return false }
        do {
            try fileManager.removeItem(at: url)
            return true
        }
        catch { return false }
    }
    
}
