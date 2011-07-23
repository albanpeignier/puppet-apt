class apt::tryphon {
  include debian

  $real_apt_tryphon_host = $apt_tryphon_host ? {
    default => $apt_tryphon_host,
    '' => "debian.tryphon.eu"
  } 

  # TODO Merge when squeeze-backports will be created
  if $debian::lenny {
    apt::sources_list { tryphon:
      content => "deb http://$real_apt_tryphon_host lenny main contrib\ndeb http://$real_apt_tryphon_host lenny-backports main contrib\n"
    }
  } 

  if $debian::squeeze {
    apt::sources_list { tryphon:
      content => "deb http://$real_apt_tryphon_host squeeze main contrib\n"
    }
  }

  apt::key { "C6ADBBD5":
    source => "http://$real_apt_tryphon_host/release.asc"
  }
}
