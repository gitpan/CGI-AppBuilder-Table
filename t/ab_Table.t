use strict;
use warnings;

use Test::More qw(no_plan); 
# use CGI::AppBuilder::Message qw(:all); 

use CGI::AppBuilder::Table;
my $class = 'CGI::AppBuilder::Table';
my $obj = CGI::AppBuilder::Table->new; 

isa_ok($obj, "CGI::AppBuilder::Table");

my @md = @CGI::AppBuilder::Table::EXPORT_OK;
foreach my $m (@md) {
    ok($obj->can($m), "$class->can('$m')");
}

diag("Test html_tag...");
# ($tag, $pr, $txt, $is_end) 
my $p = {class=>'td'}; 
is($obj->html_tag('TD'),'    <TD>', "TD");
is($obj->html_tag('TD',$p),'    <TD class=td>', "TD class");
is($obj->html_tag('TD','','Text'),'    <TD>Text', "TD Text");
is($obj->html_tag('TD','','', 1),"    <TD></TD>\n", "TD Text");

diag("Test table_column...");
my $cn = 'seq,fn,ln';
my $pr = {css_tr=>'tr_pretty',css_td=>'td_small',pretty=>1};
my $cr = {seq=>{name=>'Seq No',desc=>'Sequential number'},
         fn =>{name=>'First Name',desc=>'First name'},
         ln =>{name=>'Last Name',desc=>'Last name/family name'},
     };
my $t = $obj->table_column($cn,$pr,$cr);
print $t;

# is($ar->{full_name}, "$cfg->{fn} $cfg->{ln}", "p1");
# is($ar->{fname}, "$cfg->{fn} $cfg->{ln}", "p2");
# $obj->disp_param($ar); 
# $obj->disp_param($mk); 

1;

