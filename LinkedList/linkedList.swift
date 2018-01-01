//
//  main.swift
//  LinkedList
//
//  Created by Tuncay Cansız on 1.01.2018.
//  Copyright © 2018 Tuncay Cansız. All rights reserved.
//




import Foundation

class Node {
    let value: Int

    var next: Node?
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

class LinkedList: Sequence {

    var head: Node?

    // MARK: <Sequence>
    func makeIterator() -> LinkedListIterator {
        return LinkedListIterator(self)
    }
}

struct LinkedListIterator: IteratorProtocol {
    let linkedList: LinkedList
    var current: Node?

    init(_ linkedList: LinkedList) {
        self.linkedList = linkedList
        self.current = linkedList.head
    }

    mutating func next() -> Node? {
        guard let thisCurrent = current else { return nil }
        current = thisCurrent.next
        return thisCurrent
    }
}

let node3 = Node(value: 3, next: nil)
let node2 = Node(value: 2, next: node3)
let node1 = Node(value: 1, next: node2)

node3.next = node2


let linkedList = LinkedList()
linkedList.head = node1



// Burada print fonksiyonu 1 -> 2, 2 -> 3, 3 -> 2 yi gösterdiği için sonsuz döngüye girerek 2 -> 3, 3 -> 2 düğümleri ekrana bastırmaktadır.
for node in linkedList {
    print("\(String(describing: node.value))", "\(String(describing: node.next?.value))")
}


