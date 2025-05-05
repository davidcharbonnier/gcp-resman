fast_stage_2 = {
  networking = {
    cicd_config = {
      identity_provider = "github"
      repository = {
        branch = null
        name   = "davidcharbonnier/gcp-networking"
        type   = "github"
      }
    }
  }
  project_factory = {
    cicd_config = {
      identity_provider = "github"
      repository = {
        branch = null
        name   = "davidcharbonnier/gcp-project-factory"
        type   = "github"
      }
    }
  }
  security = {
    cicd_config = {
      identity_provider = "github"
      repository = {
        branch = null
        name   = "davidcharbonnier/gcp-security"
        type   = "github"
      }
    }
    folder_config = {
      create_env_folders = true
    }
  }
}