/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# tfdoc:file:description Project factory stage resources.

module "branch-pf-folder" {
  source = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/folder?ref=v18.0.0"
  count  = var.fast_features.project_factory ? 1 : 0
  parent = "organizations/${var.organization.id}"
  name   = "Projects"
  tag_bindings = {
    context = try(
      module.organization.tag_values["${var.tag_names.context}/projects"].id, null
    )
  }
}

module "branch-pf-dev-folder" {
  source = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/folder?ref=v18.0.0"
  count  = var.fast_features.project_factory ? 1 : 0
  parent = module.branch-pf-folder.0.id
  name   = "Development"
  iam = {
    "roles/owner"                          = [module.branch-pf-dev-sa.0.iam_email]
    "roles/logging.admin"                  = [module.branch-pf-dev-sa.0.iam_email]
    "roles/resourcemanager.folderAdmin"    = [module.branch-pf-dev-sa.0.iam_email]
    "roles/resourcemanager.projectCreator" = [module.branch-pf-dev-sa.0.iam_email]
    "roles/compute.xpnAdmin"               = [module.branch-pf-dev-sa.0.iam_email]
  }
  tag_bindings = {
    context = try(
      module.organization.tag_values["${var.tag_names.environment}/development"].id,
      null
    )
  }
}

module "branch-pf-prod-folder" {
  source = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/folder?ref=v18.0.0"
  count  = var.fast_features.project_factory ? 1 : 0
  parent = module.branch-pf-folder.0.id
  name   = "Production"
  iam = {
    "roles/owner"                          = [module.branch-pf-prod-sa.0.iam_email]
    "roles/logging.admin"                  = [module.branch-pf-prod-sa.0.iam_email]
    "roles/resourcemanager.folderAdmin"    = [module.branch-pf-prod-sa.0.iam_email]
    "roles/resourcemanager.projectCreator" = [module.branch-pf-prod-sa.0.iam_email]
    "roles/compute.xpnAdmin"               = [module.branch-pf-prod-sa.0.iam_email]
  }
  tag_bindings = {
    context = try(
      module.organization.tag_values["${var.tag_names.environment}/production"].id,
      null
    )
  }
}

module "branch-pf-dev-sa" {
  source     = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/iam-service-account?ref=v18.0.0"
  count      = var.fast_features.project_factory ? 1 : 0
  project_id = var.automation.project_id
  name       = "dev-resman-pf-0"
  # naming: environment in description
  description = "Terraform project factory development service account."
  prefix      = var.prefix
  iam = {
    "roles/iam.serviceAccountTokenCreator" = compact([
      try(module.branch-pf-dev-sa-cicd.0.iam_email, null)
    ])
  }
  iam_storage_roles = {
    (var.automation.outputs_bucket) = ["roles/storage.admin"]
  }
}

module "branch-pf-prod-sa" {
  source     = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/iam-service-account?ref=v18.0.0"
  count      = var.fast_features.project_factory ? 1 : 0
  project_id = var.automation.project_id
  name       = "prod-resman-pf-0"
  # naming: environment in description
  description = "Terraform project factory production service account."
  prefix      = var.prefix
  iam = {
    "roles/iam.serviceAccountTokenCreator" = compact([
      try(module.branch-pf-prod-sa-cicd.0.iam_email, null)
    ])
  }
  iam_storage_roles = {
    (var.automation.outputs_bucket) = ["roles/storage.admin"]
  }
}

module "branch-pf-dev-gcs" {
  source        = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/gcs?ref=v18.0.0"
  count         = var.fast_features.project_factory ? 1 : 0
  project_id    = var.automation.project_id
  name          = "dev-resman-pf-0"
  prefix        = var.prefix
  location      = var.locations.gcs
  storage_class = local.gcs_storage_class
  versioning    = true
  iam = {
    "roles/storage.objectAdmin" = [module.branch-pf-dev-sa.0.iam_email]
  }
}

module "branch-pf-prod-gcs" {
  source        = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/gcs?ref=v18.0.0"
  count         = var.fast_features.project_factory ? 1 : 0
  project_id    = var.automation.project_id
  name          = "prod-resman-pf-0"
  prefix        = var.prefix
  location      = var.locations.gcs
  storage_class = local.gcs_storage_class
  versioning    = true
  iam = {
    "roles/storage.objectAdmin" = [module.branch-pf-prod-sa.0.iam_email]
  }
}
