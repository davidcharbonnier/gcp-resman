cicd_repositories = {
  networking = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-networking"
    type              = "github"
  }
  project_factory = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-project-factory"
    type              = "github"
  }
  #project_factory_dev = {
  #  branch            = null
  #  identity_provider = "github"
  #  name              = "davidcharbonnier/gcp-project-factory"
  #  type              = "github"
  #}
  #project_factory_prod = {
  #  branch            = null
  #  identity_provider = "github"
  #  name              = "davidcharbonnier/gcp-project-factory"
  #  type              = "github"
  #}
  security = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-security"
    type              = "github"
  }
}

fast_features = {
  project_factory = true
  sandbox         = true
}