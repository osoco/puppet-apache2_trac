define apache2_trac::virtualhost($virtualhost_name, $server_admin_mail,
                                 $trac_location, $trac_install_path, $auth_required = false,
                                 $auth_name = "", $auth_file = "", 
                                 $is_https = false, $ssl_cert = "", $ssl_cert_key = "") {
    include apache2_trac

    apache2::virtualhost { "$virtualhost_name":
        virtualhost_name => "$virtualhost_name",
        server_admin_mail => "$server_admin_mail",
        document_root => "",
        virtualhost_specifics => template("apache2_trac/trac_virtual_host_specifics.erb"),
        is_https => $is_https,
        ssl_cert => "$ssl_cert",
        ssl_cert_key => "$ssl_cert_key",
    }
}
