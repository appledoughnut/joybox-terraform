provider "aws" {

}

terraform {
    cloud {
        organization = "appledoughnut42"
        workspaces  {
            name = "joybox-kms"
        }
    }
}