<h1 align=center>Dockette / Nette Tester</h1>

<p align=center>
   <a href="https://github.com/dockette/nette-tester/actions"><img src="https://github.com/dockette/nette-tester/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/nette-tester"><img src="https://img.shields.io/docker/pulls/dockette/nette-tester.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

Test your application / library in a Docker container.

## Tools

- Debian Jessie
- PHP 5.6
- Git
- cURL
- Composer

## Usage

### Composer

If there is a composer.json in `/srv/app`, `composer install` is called first.

### Testing

On default is command `tester -s -j 40 -p php /srv/app` called.

```sh
docker run \
    -v /path/to/myapp:/srv/app \
    dockette/nette-tester:latest
```

### Custom

You can modifie tester by your own. See list of variables below.

| VARIABLE  | DEFAULT   | DESCRIPTION                           |
|---------- |---------- |-------------------------------------- |
| FOLDER    | /srv/app  | string path to tests folder           |
| SCRIPT    | empty     | string path to script with arguments  |
| THREADS   | 40        | number > 0                            |
| INFO      | empty     | 1                                     |
| WATCH     | empty     | 1                                     |
| PHP       | php       | `php` or `php-cgi`                   |

```sh
docker run \
    -v /path/to/myapp:/srv/app \
    -e FOLDER='/srv/app/a/b/tests' \
    -e INFO=1 \
    -e WATCH=1 \
    -e THREADS=10 \
    -e PHP='php-cgi' \
    dockette/nette-tester:latest
```

```sh
docker run \
    -v /path/to/myapp:/srv/app \
    -e SCRIPT='/srv/app/vendor/bin/tester -s -p php -j 30 /srv/app/tests' \
    dockette/nette-tester:latest
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
