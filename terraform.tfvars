cicd_repositories = {
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
    descriptive_name     = "Infra"
    group_iam            = {}
    impersonation_groups = []
    cicd = {
      branch            = null
      identity_provider = "github"
      name              = "davidcharbonnier/gcp-team-infra"
      type              = "github"
    }
  }
}