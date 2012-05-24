class apache2_trac ($version = "latest") {

    include trac
    include apache2
    include apache2_fcgid
    include apache2::auth_digest

}
