# hostname cookbook

[![Build Status](https://travis-ci.org/3ofcoins/chef-cookbook-hostname.svg?branch=master)](https://travis-ci.org/3ofcoins/chef-cookbook-hostname)
[![Chef cookbook](https://img.shields.io/cookbook/v/hostname.svg)](https://supermarket.chef.io/cookbooks/hostname)
## Description

Sets hostname and FQDN of the node. The latest code is hosted at
https://github.com/3ofcoins/chef-cookbook-hostname

### Important

Setting hostname on FQDN is not (and won't be) supported. Unfortunately, using dots in the hostname can cause
[inconsistent results for any system that consumes DNS](http://serverfault.com/questions/229331/can-i-have-dots-in-a-hostname)
and [is not allowed by RFC952](http://tools.ietf.org/html/rfc952). If a user
needs additional info in their shell prompt, they can change PS1 in etc/profile
to include the FQDN together with any information they find useful (such as
the customer, the environment, etc).

## Attributes

- `node['set_fqdn']` - FQDN to set.

The asterisk character will be replaced with `node.name`. This way,
you can add this to base role:

```ruby
default_attributes :set_fqdn => '*.project-domain.com'
```

and have node set its FQDN and hostname based on its chef node name
(which is provided on `chef-client` first run's command line).

- `node['hostname_cookbook']['hostsfile_ip']` -- IP used in
  `/etc/hosts` to correctly set FQDN (default: `127.0.1.1`)
- `node['hostname_cookbook']['hostsfile_aliases']` -- list of aliases used in
  `/etc/hosts` for the ip set above (default: [`hostname`])
- `node['hostname_cookbook']['hostsfile_include_hostname_in_aliases']` -- whether to include the hostname
  at the end of the aliases list above (default: true)

- `node['hostname_cookbook']['append_hostsfile_ip']` -- Set to `false` to
  prevent an entry for the node's hostname from being appended in `/etc/hosts` (default: `true`)

## Recipes

* `hostname::default` -- will set node's FQDN to value of `set_fqdn` attribute,
and hostname to its host part (up to first dot).
* `hostname::vmware` -- sets hostname automatically using vmtoolsd.
You do not need to set `node["set_fqdn"]`.

## Author

Author: Maciej Pasternacki maciej@3ofcoins.net
