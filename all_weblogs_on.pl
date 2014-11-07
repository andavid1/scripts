 all_weblogs_on.pl




#!/usr/bin/perl

foreach $i ( `find /home/virtual/site*/info/current/weblogs | xargs grep "enabled = 0"` ) {
        next unless( $i =~ /site(\d+)/ );
        $site_num = $1;

        print "-"x79 . "\n";
        print "/usr/local/bin/EditVirtDomain -c weblogs,enabled=1 site$site_num\n";
        system "/usr/local/bin/EditVirtDomain -c weblogs,enabled=1 site$site_num 2>&1";
}
