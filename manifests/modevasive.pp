class apache::modevasive (
  $packagename_modevasive = $::apache::params::packagename_modevasive,
  $configfile_modevasive  = $::apache::params::configfile_modevasive,
  $template_modevasive    = $::apache::params::template_modevasive,
  $dosemailnotify         = undef,
  $dospagecount           = '2',
  $dossitecount           = '50',
  $dosblockingperiod      = '10',
  $doslogdir              = '/var/log/mod_evasive',
  $doswhitelist           = [],
){
  package { $packagename_modevasive: ensure => installed }
  file { $configfile_modevasive:
    require => package[$packagename_modevasive],
    content => template($template_modevasive),
  }
}
