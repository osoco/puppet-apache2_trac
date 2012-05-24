puppet-apache2_trac
===================

Puppet module to manage a typical trac apache2 configuration. Depends on:
  * https://github.com/osoco/puppet-apache2
  * https://github.com/osoco/apache2_fcgid
  * https://github.com/osoco/puppet-apache2_ssl (not mandatory, but usefull for ssl repos)

Example using both apache2 and apache2_ssl modules:

    class my_trac_apache_class {

        include apache2_trac
        include apache2_ssl

        apache2_ssl::certificate { "trac.myorg.com-cert":
            cert_name => "$trac.myorg.com",
            cert_file_source => "puppet:///modules/my_trac_apache2_class/trac.myorg.com.pem",
            cert_key_file_source => "puppet:///modules/my_trac_apache2_class/trac.myorg.com.key"
        }

        apache2_trac::virtualhost { "trac.myorg.com":
           virtualhost_name => "trac.myorg.com",
           server_admin_mail => "admin@myorg.com",
           trac_location => "/",
           trac_install_path => "/var/trac",
           auth_required => true,
           auth_file => "/var/svn/conf/svn-auth",
           auth_name => "MyOrg SVN Repo",
           is_https => true,
           ssl_cert => "$apache2_ssl::apache2_ssl_dir/trac.myorg.com.pem",
           ssl_cert_key => "$apache2_ssl::apache2_ssl_dir/trac.myorg.com.key",
        }
    }


