//: Playground - noun: a place where people can play
import UIKit
import Foundation
// This deletes the top and to the right points from original selection
struct GameModel{
    var matrix:[[Int]]
}
extension GameModel{
    
    init(model: String) {
        if(model == "Small"){
            let matrix = [[1,   2 ],
                          [3,   4 ],
                                        ]
         
            self.init(matrix: matrix)
        }else if(model == "Medium"){
            let matrix = [[1,   2,  3 , 4 , 5],
                          [6,   7,  8,  9, 10],
                          [11,  12, 13, 14, 15],
                          [16,  17, 18, 19, 20],
                          [21,  22, 23, 24, 25],
                          [26,  27, 28, 29, 30],
                          [31,  32, 33, 34, 35],
                          [36,  37, 38, 39, 40]]
                       self.init(matrix: matrix)
        }else{
            let matrix = [[1,   2,  3 , 4 , 5 ,6 ,7],
                          [8,  9, 10, 11, 12, 13 , 14],
                          [15 ,16 ,17 ,18 ,19 ,20 ,21] ,
                          [22 ,23 ,24 ,25 ,26 ,27 ,28] ,
                          [29 ,30 ,31 ,32 ,33 ,34 ,35] ,
                          [36 ,37 ,38 ,39 ,40 ,41 ,42] ,
                          [43 ,44 ,45 ,46 ,47 ,48 ,49] ,
                          [50 ,51 ,52 ,53 ,54 ,55 ,56] ,
                          [57 ,58 ,59 ,60 ,61 ,62 ,63] ,
                          [64 ,65 ,66 ,67 ,68 ,69 ,70] ,
                          [71 ,72 ,73 ,74 ,75 ,76 ,77]]
                        self.init(matrix: matrix)
        }
    }
}

class Game{
    var board: [[Int]]
    let ROWS: Int
    let COLS: Int
    init(model: String) {
        self.board = GameModel(model: model).matrix
        self.ROWS = board.count
        self.COLS = board[0].count
    }
    func selection(_ row:Int , col:Int){
        for i in 0...row{
            for j in col...(COLS-1){
                board[i][j] = 0
            }
        }
    }
    func printBoard(){
        for i in 0..<ROWS{
            print(board[i])
        }
        print("")
    }
}




public class TreeNode<T> {
    public var value: T
    
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return s
    }
}

var game = Game(model: "Small")



//Original GameBoard
game.printBoard()
let tree = TreeNode<[[Int]]>(value: game.board)


func treeMaker(tree: TreeNode<[[Int]]>) -> Void{
    let board = tree.value
    for i in 0..<game.ROWS {
        for j in 0..<game.COLS {
            game.board = board
            if(game.board[i][game.COLS-j-1] != 0 ){
                game.selection(i, col: game.COLS-j-1)
                
                tree.addChild(TreeNode<[[Int]]>(value: game.board))
            }
        }
    }
    if(!tree.children.isEmpty){
        tree.children.popLast()
        for t in tree.children{
           treeMaker(tree: t)
        }
    }
}


treeMaker(tree: tree)

print(tree)


