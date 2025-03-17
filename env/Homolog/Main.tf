module "homolog" {
    source = "../../infra"

    nome_repositorio = "homolog"
    cargoIAM = "homolog"
    ambiante = "homolog"
    imagem="kquesso/go_ci:71"
}

output "IP_alb" {
  value = module.homolog.IP
}
