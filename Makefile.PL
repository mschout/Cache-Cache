use ExtUtils::MakeMaker;

##
# Constants
##


my $NAME = 'Cache::Cache';
my $VERSION_FROM = 'lib/Cache/Cache.pm';
my $COMPRESS = 'gzip';
my $SUFFIX = '.gz';
my $DEFAULT_PREREQ_PM = {
                         Digest::MD5 => '2.09',
                         File::Spec => '0.82',
                         Storable => '1.011',
                         IPC::ShareLite => '0.08'
                        };



##
# Main
##


Main( );


##
# Subroutines
##


sub Main
{
  my %options;

  $options{NAME} = $NAME;
  $options{VERSION_FROM} = $VERSION_FROM;
  $options{dist} = { COMPRESS => $COMPRESS, SUFFIX => $SUFFIX };
  $options{PREREQ_PM} = $DEFAULT_PREREQ_PM;

  my $has_sharelite = Has_Module( 'IPC::ShareLite' );

  if ( not $has_sharelite )
  {
    Print_ShareLite_Missing_Message( );
    $options{test} = { TESTS => 't/[12356]*.t' };
    delete $options{PREREQ_PM}->{IPC::ShareLite};
  }

  WriteMakefile( %options );

}


sub Has_Module
{
  my ( $module ) = @_;

  print "Checking for $module... ";

  my $has_module = ( eval "require $module"  && ! $@ );

  print ( $has_module ? "found\n" : "not found\n" );

  return $has_module;
}


sub Print_ShareLite_Missing_Message
{
  print <<END

  NOTE: Your system does not seem to have IPC::ShareLite installed.
  This module is a prerequisite for the SharedMemoryCache
  implementations.  However, since it is not available on all
  platforms, the Cache::Cache module does not list it as an explicit
  dependency.  If you are able to build IPC::ShareLite (available on
  CPAN), please install it now and re run this Makefile.PL.
  Automatically disabling the tests for the SharedMemoryCache.

END
}
