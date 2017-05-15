class apache::params {
  if $::osfamily == 'RedHat' {
    $package_name = [ 'httpd' ]
    $packagename_modsecurity = [ 'mod_security' ]
    $packagename_modevasive = [ 'mod_evasive' ]
    $configfile = '/etc/httpd/conf/httpd.conf'
    $configfile_modsecurity  = '/etc/httpd/conf.d/mod_security.conf'
    $configfile_modevasive  = '/etc/httpd/conf.d/mod_evasive.conf'
    $sitesdir = '/etc/httpd/'
    case $::operatingsystemrelease {
      /^6.*/: {
        $template_modevasive = 'apache/mod_evasive.conf.c.6.erb'
      }
      /^7.*/: {
        $template_modevasive = 'apache/mod_evasive.conf.c.7.erb'
      }
      default: {
        $template_modevasive = 'apache/mod_evasive.conf.c.6.erb'
      }
    }
  }
  elsif $::osfamily == 'Debian' {
    $package_name = [ 'apache2' ]
    $packagename_modsecurity = [ 'libapache2-modsecurity' ]
    $packagename_modevasive = [ 'libapache2-mod-evasive' ]
    $configfile = '/etc/apache2/apache2.conf'
    $configfile_modsecurity = '/etc/modsecurity/modsecurity.conf'
    $sitesdir = '/etc/apache2/'
    case $::operatingsystemrelease {
      /^12.*/: {
        $configfile_modevasive = '/etc/apache2/mods-available/mod-evasive.conf'
        $template_modevasive = 'apache/mod-evasive.conf.u.12.erb'
      }
      /^14.*/: {
        $configfile_modevasive = '/etc/apache2/mods-available/evasive.conf'
        $template_modevasive = 'apache/evasive.conf.u.14.erb'
      }
      /^16.*/: {
        $configfile_modevasive = '/etc/apache2/mods-available/evasive.conf'
        $template_modevasive = 'apache/evasive.conf.u.16.erb'
      }
      default: {
        $configfile_modevasive = '/etc/apache2/mods-available/mod-evasive.conf'
        $template_modevasive = 'apache/mod-evasive.conf.u.12.erb'
      }
    }
  }
}

