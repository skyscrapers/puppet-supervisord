# == Define: supervisord::config::file
#
define supervisord::config::file (
  $command          => undef,
  $directory        => undef,
  $user             => undef,
  $process_name     => '%(program_name)s_%(process_num)s',
  $startsecs        => 10,
  $numprocs         => 1,
  $autostart        => 'true',
  $autorestart      => 'true',
  $redirect_stderr  => 'true',
  $startretries     => 3,
) {
  file { "${::supervisord::params::includedir}/${title}.conf":
    ensure  => file,
    mode    => '0644',
    content => template('supervisord/etc/supervisor/service.conf.erb'),
    owner   => root,
    group   => root,
    require => Class['supervisord'],
    notify  => Service['supervisor'],
  }
}
