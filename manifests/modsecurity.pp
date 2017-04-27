class apache::modsecurity (
  $packagename_modsecurity = $::apache::params::packagename_modsecurity,
  $configfile_modsecurity  = $::apache::params::configfile_modsecurity,
  $template_modsecurity    = $::apache::params::template_modsecurity,
  $secruleengine           = 'On',
  $secrequestbodyaccess    = 'On',
  $secresponsebodyaccess   = 'On',
  $secdatadir              = undef,
) inherits ::apache::params {
  package { $packagename_modsecurity: ensure => installed }
  file { $configfile_modsecurity:
    require => package[$packagename_modsecurity],
    content => template($template_modsecurity),
  }
}
