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

# == Class: supervisord
#
# This class is able to activate and configure supervisord
#
#
# === Parameters
#
# [*includefiles*]
#   Where can we find the supervisord files?
#
# === Examples
#
# * Installation of supervisord
#     class {'supervisord':
#       includefiles => '/etc/test/*.conf
#     }
#
class supervisord (
  $includefiles = $supervisord::params::includefiles,
) inherits supervisord::params {

  class { 'supervisord::install': } ->
  class { 'supervisord::config': } ->
  class { 'supervisord::service': } ->
  Class['supervisord']
}
