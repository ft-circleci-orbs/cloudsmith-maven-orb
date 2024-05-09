# Cloudsmith Maven Orb


A CircleCI orb to assist with downloading maven packages from and publishing maven packages to Cloudsmith.

---

## Getting Started

The orb commands require the following environment variables to be set:

* `CLOUDSMITH_ORGANISATION` : The identity/slug of the Cloudsmith organisation to use when authenticating with OIDC. Defaults to "financial-times" if not set.
* `CLOUDSMITH_SERVICE_ACCOUNT` : The identity/slug of the Cloudsmith service account to use when authenticating with OIDC.

These are used to authenticate with Cloudsmith using OIDC and can be found in the [Cloudsmith UI](https://cloudsmith.io/).


---

## Documentation



---