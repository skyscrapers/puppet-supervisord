# puppet-supervisord

## Module description

Install and configure supervisord with Puppet.

## Setup

### What puppet-supervisord affects

`puppet-supervisord` will:

- install `supervisor` via the system package manager (`apt` in Ubuntu)
- create the supervisord main config file (`/etc/supervisor/supervisord.conf`)
- create any additional config files defined as `supervisord::config::file`. It will create these files in the specified `includefiles` directory (`/etc/supervisor/conf.d` by default)
- create and enable the `supervisor` service

### Setup Requirements

The following puppet modules are required:

/

### Usage

You just need to include the module to get started.

```puppet
include ::supervisord
```

By default, supervisord will look for additional config files in `/etc/supervisor/conf.d/`, but you can change that directory with the `includefiles` parameter.

```puppet
class { '::supervisord':
  includefiles => '/usr/local/supervisor/*.conf',
}
```

You can also add supervisord workloads directly via the `supervisord::config::file` definition.

```puppet
supervisord::config::file { "myapp"
  command   => "/usr/bin/php myapp.php",
  directory => "/var/www/myapp",
  user      => "www-data",
  numprocs  => 5
}
```

Additionally, the module will automatically create any `supervisord::config::file` defined in Hiera in `supervisord::config_files`.

```yaml
supervisord::config_files:
  myapp:
    command: "/usr/bin/php myapp.php"
    directory: "/var/www/myapp"
    user: "www-data"
    numprocs: 5
  myotherapp:
    command: "/usr/bin/php foo.php"
    directory: "/var/www/myotherapp"
    user: "bar"
    numprocs: 1
```

## Limitations

Tested on Ubuntu 10.04, 12.04 and 14.04
