cicd_repositories = {
  data_platform_dev  = null
  data_platform_prod = null
  gke_dev = {
    branch            = "dev"
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-gke"
    type              = "github"
  }
  gke_prod = {
    branch            = "prod"
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-gke"
    type              = "github"
  }
  networking = {
    branch            = "master"
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-networking"
    type              = "github"
  }
  project_factory_dev = {
    branch            = "dev"
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-project-factory"
    type              = "github"
  }
  project_factory_prod = {
    branch            = "prod"
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-project-factory"
    type              = "github"
  }
  security = {
    branch            = "master"
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-security"
    type              = "github"
  }
}
