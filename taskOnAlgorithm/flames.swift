import Foundation
import Glibc
var c = 0
var name1 = ""
var name2 = ""
let formattedString1 = name1.replacingOccurrences(of: " ", with: "")
let formattedString2 = name2.replacingOccurrences(of: " ", with: "")
var s = String (formattedString1.lowercased())
var d = String (formattedString2.lowercased())
var a = Array(s)
var b = Array(d)
var common = [String]()
for i in a{
    c = c + 1
if b.contains(i){
    c = c - 1
    var remove = a.remove(at:c)
    common.append(String(remove))
}
}
var name_val1 = (s.count - common.count) 
var name_val2 = (b.count - common.count)
var val = name_val1 + name_val2
var game = ["f","l","a","m","e","s"]
var remove_letter = [Int]()

remove_letter.append(val%6)
remove_letter.append(val%5)
remove_letter.append(val%4)
remove_letter.append(val%3)
remove_letter.append(val%2)
remove_letter.append(val%1)
//######################################0000000000000000000000000000000
if remove_letter[0] == 0 {
    let removed = game.remove(at:game.count-1)
}
else
{
    if remove_letter[0] == 1 {
         let removed = game.remove(at:0)
    }
    else
    {
 var leftarray = game[remove_letter[0]...game.count-1]
 var rightarray = game[0...remove_letter[0]-2]
 game = Array(leftarray + rightarray)
    }
}
if remove_letter[1] == 0 {
    let removed = game.remove(at:game.count-1)
}
else
{
    if remove_letter[1] == 1 {
         let removed = game.remove(at:0)
    }
    else
    {
 var leftarray = game[remove_letter[1]...game.count-1]
 var rightarray = game[0...remove_letter[1]-2]
 game = Array(leftarray + rightarray)
    }
}

if remove_letter[2] == 0 {
    let removed = game.remove(at:game.count-1)
}
else
{
    if remove_letter[2] == 1 {
         let removed = game.remove(at:0)
    }
    else
    {
 var leftarray = game[remove_letter[2]...game.count-1]
 var rightarray = game[0...remove_letter[2]-2]
 game = Array(leftarray + rightarray)
    }
}
if remove_letter[3] == 0 {
    let removed = game.remove(at:game.count-1)
}
else
{
    if remove_letter[3] == 1 {
         let removed = game.remove(at:0)
    }
    else
    {
 var leftarray = game[remove_letter[3]...game.count-1]
 var rightarray = game[0...remove_letter[3]-2]
 game = Array(leftarray + rightarray)
    }
}
if remove_letter[4] == 0 {
    let removed = game.remove(at:game.count-1)
}
else
{
    if remove_letter[4] == 1 {
         let removed = game.remove(at:0)
    }
    else
    {
 var leftarray = game[remove_letter[4]...game.count-1]
 var rightarray = game[0...remove_letter[4]-2]
 game = Array(leftarray + rightarray)
    }
}
print(game)

