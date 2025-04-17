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
    descriptive_name         = "Infra"
    iam_by_principals        = {}
    impersonation_principals = []
    cicd = {
      branch            = null
      identity_provider = "github"
      name              = "davidcharbonnier/gcp-team-infra"
      type              = "github"
    }
  }
}