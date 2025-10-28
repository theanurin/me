# Get Started — Using Git LFS with this repository

This repository uses Git Large File Storage (Git LFS) to store large binary files (models, datasets, large media, etc.). This guide shows how to install Git LFS, enable it for this repo, and common workflows (add/commit/push, clone, CI, and troubleshooting).

**Quick start:**

- Install Git LFS (see platform-specific commands below).
- In a local clone of this repo run:
  ```shell
  git lfs install
  git lfs pull        # downloads any LFS objects for the current HEAD
  ```
- Add or update tracked files as usual:
  ```shell
  git add path/to/large-file.bin
  git commit -m "Add large file"
  git push origin main
  ```

## Install Git LFS

- macOS (Homebrew):
  ```shell
    brew install git-lfs
  ```
- Debian/Ubuntu:
  ```shell
  sudo apt update
  sudo apt install git-lfs
  ```
- Windows (Chocolatey):
  ```powershell
  choco install git-lfs
  ```
- Windows/MSI: download installer from https://git-lfs.github.com and run it.

After installation, run:
```shell
git lfs install
```
(You only need to run `git lfs install` once per machine, but running it in a fresh clone is harmless.)

## How tracking works (important)

Git LFS replaces large files with small text pointer files in Git and stores the real content in LFS storage.
These tracking rules are recorded in `.gitattributes` at the repo root.

Example entry:

```text
*.psd filter=lfs diff=lfs merge=lfs -text
models/*.bin filter=lfs diff=lfs merge=lfs -text
```

When you run `git lfs track "<pattern>"`, Git LFS updates `.gitattributes` and you must commit that file.

## Add, commit, and push files

- Track patterns (only required once for each pattern):
  ```shell
  git lfs track "*.psd"
  git lfs track "models/*.bin"
  git add .gitattributes
  git commit -m "Track .psd and models with Git LFS"
  ```
- Add large files normally:
  ```shell
  git add models/large_model.bin
  git commit -m "Add model"
  git push origin main
  ```
- Git will upload LFS objects during the push.

## Cloning and fetching

If you clone this repo and you have Git LFS installed, Git will automatically fetch LFS objects during clone.

If you already cloned without LFS installed, run:

```shell
git lfs install
git lfs pull       # pulls LFS objects for current checkout
```

To fetch all LFS objects (useful in CI):

```shell
git lfs fetch --all
git lfs checkout
```

## CI/headless environments

Make sure your CI runner has Git LFS installed and runs:

```shell
git lfs install --local
git lfs fetch --all
git lfs checkout
```

If your CI checks out detached commits or uses shallow clones, prefer `git lfs fetch --all` then `git lfs checkout` to ensure objects are present.

## Migrating existing large files into LFS

If the repo already has large files committed in Git history, you can migrate them into LFS. This rewrites history — use with care and coordinate with collaborators.

Example (rewrites history on all branches):

```shell
# preview first:
git lfs migrate info --include="*.bin,*.psd"

# perform migration (force-push required afterwards)
git lfs migrate import --include="*.bin,*.psd"
# After migration, force-push branches you want to update:
git push --force --all
git push --force --tags
```

Read the Git LFS docs before running migrations.

## Inspecting LFS status and objects

- List tracked patterns:
  ```shell
  git lfs track --list
  ```
- Show LFS-tracked files in the working tree:
  ```shell
  git lfs ls-files
  ```
- Show pointer file details:
  ```shell
  git lfs pointer --file=path/to/file
  ```

## Locking files (optional)

If you need exclusive locks (helpful for binary assets):

```shell
git lfs lock path/to/file.ext
# work on file
git add path/to/file.ext
git commit -m "Edit locked file"
git push
git lfs unlock path/to/file.ext
```

Note: locking must be supported by the remote (GitHub and others support LFS locking).

## Cleanup and storage notes

- Deleting LFS objects from Git history requires a migration and force-push — storage providers may still keep objects in their storage until garbage collection runs.
- GitHub LFS imposes storage and bandwidth limits on accounts/organizations; monitor usage and consider hosting large datasets in a dedicated storage service if needed.

## Troubleshooting

- "Pointer file checked in instead of content" — likely Git LFS not installed on the machine that committed the file. Install Git LFS, then run:
  ```shell
  git lfs pull
  ```
- "Missing LFS objects on checkout" — run:
  ```shell
  git lfs fetch
  git lfs checkout
  ```
- "Push fails due to storage/bandwidth limits" — check your LFS quota on the remote provider and consider removing or archiving large files elsewhere.

## Example .gitattributes snippet

Add to the repo root (this file is created/updated by `git lfs track`):

```text
# Track model binaries and large media
models/*.bin filter=lfs diff=lfs merge=lfs -text
media/*.{png,jpg,mp4} filter=lfs diff=lfs merge=lfs -text
```
