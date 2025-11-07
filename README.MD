# linode-terraform

This is a terraform setup meant to deploy a single 3-node kubernetes cluster, and pull an image from a public github registry

*Note: this is for learning purposes only*

## Required variables

```linode_token```

## Running

```sh
terraform apply
```

## Notes

in some instances, linode fails to destroy all linodes attached to a cluster