//
//  LRU.swift
//  SwiftTest
//
//  Created by FlyElephant on 2019/4/12.
//  Copyright © 2019 FlyElephant. All rights reserved.
//

import Foundation

class LinkNode {
    var pre: LinkNode?
    var next: LinkNode?
    var key: Int?
    var value: String?
    
    init(_ k: Int, _ v: String) {
        key = k
        value = v
    }
}

class LinkedList {
    
    var head: LinkNode?
    var tail: LinkNode?
    var count: Int = 0 // 记录链表结点总数
    
    func addHead(_ key: Int, _ value: String) -> LinkNode {
        let node = LinkNode(key, value)
        defer {
            head = node
            count += 1
        }
        guard let _ = head else {
            tail = node
            return node
        }
        head?.pre = node
        node.pre = nil
        node.next = head
        return node
    }
    
    // 移动到头部
    func moveToHead(_ node: LinkNode) {
        guard node !== head else { return }
        let pre = node.pre
        let next = node.next
        pre?.next = next
        next?.pre = pre
        
        node.next = head
        node.pre = nil
        
        if tail == nil {
            tail = node
        }
        self.head = node
    }
    
    // 删除最后的结点
    func removeLast() -> LinkNode? {
        guard let node = self.tail else { return nil }
        let pre = node.pre
        pre?.next = nil
        if count == 1 {
            head = nil
        }
        count -= 1
        return node
    }
}

class LRUCache {
    
    var hashMap: [Int: LinkNode] = [:]
    var linkedList = LinkedList()
    var capacity = 0
    
    init(_ cap: Int) {
        capacity = cap
    }
    
    func setValue(_ key: Int, value: String) {
        if hashMap.keys.contains(key) { // 包含当前对应的key值
            let node = hashMap[key]
            if let head = node {
                linkedList.moveToHead(head)
            }
        } else {
            let node = linkedList.addHead(key, value)
            hashMap[key] = node
        }
        if linkedList.count > capacity { // 超出容量删除数据
            let last = linkedList.removeLast()
            if let key = last?.key {
                hashMap.removeValue(forKey: key)
            }
        }
    }
    
    func get(_ key: Int) -> String? {
        guard let node = hashMap[key] else { return nil }
        return node.value
    }
    
    func printList() {
        print("~~~~~~~")
        var node = linkedList.head
        while node != nil {
            print("\(node!.key!)---\(node!.value!)")
            node = node?.next
        }
    }
}
