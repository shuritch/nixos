{
  my.network = {
    vpn.enable = true;

    extraNameservers = [ "172.18.48.218" "172.18.18.40" ];
    fallbackDns = [ "8.8.8.8" "1.1.1.1" ];
    fallbackDomains = [
      "~artifactory.top"
      "~docs.re.rip"
      "~cloud.re.rip"
      "~cloud-stage.re.rip"
      "~kibana.re.rip"
    ];

    extraHosts = ''
      0.0.0.0 seo-admin.local.com
      127.0.0.1 seo-admin.local.com
      ::1 seo-admin.local.com
    '';
  };
}
