



locals {
  # 변수에 접근하여 파일명 생성
  base_path = "${path.module}/${var.region}"
}


resource "local_file" "abc" {
  count   = length(var.names)
  content = "abc"
  # 변수 인덱스에 직접 접근
  filename = "${local.base_path}/abc-${var.names[count.index]}.txt"
}

resource "local_file" "def" {
  count   = length(var.names)
  content = local_file.abc[count.index].content
  # element function 활용
  filename = "${local.base_path}/def-${element(var.names, count.index)}.txt"
}


output "A_upper_value" {
  value = [for v in var.names : upper(v)]
}

output "B_index_and_value" {
  value = [for i, v in var.names : "${i} is ${v}"]
}

output "C_make_object" {
  value = { for v in var.names : v => upper(v) }
}

output "D_with_filter" {
  value = [for v in var.names : upper(v) if v != "a"]
}
