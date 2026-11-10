# App metadata repository

- Application registration is owned by the runtime or existing LuCI package.
- `applications/app-meta-*` contains software-center metadata, metadata icons and dependencies; never application manifests, registration symlinks or application asset copies.
- The only application registry is `/usr/share/linkease/apps.d`; do not create a second registry or a companion registration package.
- Canonical standard: `../istoreos-app-hub/docs/architecture/linkease-app-registration.md`.
- Keep hub and metadata changes aligned through the explicit app mapping; preserve pre-existing local changes and do not run a global rsync --delete.
- Registration migration uses existing unversioned META_DEPENDS; users update the owning plugins separately. Do not add minimum-version constraints, extend shared meta.mk, or change metadata CI for this migration.
