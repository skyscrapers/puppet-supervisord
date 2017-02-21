##### LICENSE

# Copyright (c) Skyscrapers (iLibris bvba) 2014 - http://skyscrape.rs
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# == Class supervisord::config
#
# This class is called from supervisord
#
class supervisord::config {

  $environment = $::supervisord::environment

  if $::supervisord::includefiles == $::supervisord::params::includefiles {
    $include = $::supervisord::includefiles
  } else { # Also include the default supervisord config dir
    $include = "${::supervisord::includefiles} ${::supervisord::params::includefiles}"
  }
  file {
    '/etc/supervisor/supervisord.conf':
      ensure  => file,
      content => template('supervisord/etc/supervisor/supervisord.conf.erb'),
      mode    => '0644',
      owner   => root,
      group   => root
  }

  create_resources('supervisord::config::file', hiera_hash('supervisord::config_files', {}), {})
}
