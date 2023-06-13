#
# = Define: limits
#
# Manage limits.conf settings.
#
define limits (
  $ensure   = present,
  $priority = false,
  $domain   = '*',
  $type     = 'soft',
  $item     = undef,
  $value    = undef,
  $comment  = undef,
) {

  if ( $priority ) {
    $limits_title = "${priority}-${title}"
  } else {
    $limits_title = $title
  }

  file { "/etc/security/limits.d/${limits_title}.conf":
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('limits/limits.confd.erb'),
  }

}
