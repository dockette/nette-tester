# AGENTS.md

## Project

Dockette Nette Tester builds `dockette/nette-tester`, a legacy Debian Jessie and PHP 5.6 image for running Nette Tester against projects mounted into `/srv/app`.

## Images

- Default image: `dockette/nette-tester:latest`.
- Build context: repository root `.` with `Dockerfile` and `run-tester.sh`.
- Base image: `debian:jessie`.
- The image installs Composer and `nette/tester:~1.6.0` into `/srv/tester`.
- GitHub Actions builds `linux/amd64` for tests, then publishes `linux/amd64,linux/arm64` through the shared Dockette Docker workflow on `master` and the weekly schedule.

## Commands

- `make build` builds `${DOCKER_IMAGE}:${DOCKER_TAG}` from `.`.
- `make test` smoke-checks PHP and Nette Tester inside the built image.
- `make run` runs the image against the current working directory mounted at `/srv/app`.

## Testing Notes

- Prefer `make test` after Dockerfile or `run-tester.sh` changes.
- Use `make -n build test run` to dry-run command wiring without requiring Docker.
- Full smoke tests require Docker and a locally built `${DOCKER_IMAGE}:${DOCKER_TAG}` image.

## Guidelines

- Keep `Dockerfile`, `run-tester.sh`, `Makefile`, README, and `.github/workflows/docker.yml` aligned.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Keep README badges and maintenance sections consistent with other Dockette image repos.
- Preserve the legacy PHP 5.6 and Nette Tester 1.x behavior unless the image support policy changes.
- Do not introduce unrelated formatting or structural changes.
