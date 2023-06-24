resource "aws_ebs_volume" "example" {
    availability_zone = "ap-southeast-1a"
    size = 8
    # merge({ Name = "Myvolume" }, var.project_tags): Gộp các map, nơi một map chứa cặp key-value { Name = "Myvolume" } được gộp với map var.project_tags
    # for k, v in ...: k => lower(v): Đây là một vòng lặp for, trong trường hợp này, key k được giữ nguyên, và value v được chuyển thành chữ thường
    tags = {for k, v in merge({Name = "Myvolume"}, var.project_tags): k => lower(v)}
}
