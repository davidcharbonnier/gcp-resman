cicd_repositories = {
  gke_dev = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-gke"
    type              = "github"
  }
  gke_prod = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-gke"
    type              = "github"
  }
  networking = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-networking"
    type              = "github"
  }
  project_factory_dev = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-project-factory"
    type              = "github"
  }
  project_factory_prod = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-project-factory"
    type              = "github"
  }
  security = {
    branch            = null
    identity_provider = "github"
    name              = "davidcharbonnier/gcp-security"
    type              = "github"
  }
}

team_folders = {
  infra = {
    descriptive_name     = "Infra projects"
    group_iam            = {}
    impersonation_groups = []
  }
}