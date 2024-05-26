
# provider "kubernetes" {
#   config_path    = "~/.kube/config"
#   config_context = "my-context"
# }

# # create example namespace
# # with annotation name=example-annotation
# resource "kubernetes_namespace" "example" {
#   metadata {
#     annotations = {
#       name = "example-annotation"
#     }
#     # it attributes name of example namespace
#     # 여기서 name은 인수로 사용되며 각 provider 별 API문서를 참조하여 다르게 동작하며
#     # kubernetes의 경우 metadata.name을 사용
#     name = "terraform-example-namespace"
#   }
# }

# # example secret of namespace named
# resource "kubernetes_secret" "example" {
#   metadata {
#     # 
#     namespace = kubernetes_namespace.example.metadata.0.name # namespace 리소스 인수 참조
#     name      = "terraform-example"
#   }
#   data = {
#     password = "P4ssw0rd"
#   }
# }
