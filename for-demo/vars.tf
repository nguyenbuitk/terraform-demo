variable "list1" {
  type = list(string)
  default = [1,10,9,3]
}

variable "list2" {
    type = list(string)
    default = ["apple", "pear", "banana"]
}

variable "map1" {
    type = map(number)
    default = {
      "apple" = 4
      "pear" = 3
    }
}
