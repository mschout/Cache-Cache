#####################################################################
# $Id: Cache.pm,v 1.26 2001/12/09 17:00:35 dclinton Exp $
# Copyright (C) 2001 DeWitt Clinton  All Rights Reserved
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either expressed or
# implied. See the License for the specific language governing
# rights and limitations under the License.
######################################################################


package Cache::Backend;

use strict;

sub new;

sub delete_key;

sub delete_namespace;

sub get_keys;

sub get_namespaces;

sub get_size;

sub restore;

sub store;

1;

__END__

=pod

=head1 NAME

Cache::Backend -- and interface for cache peristance mechanisms

=head1 DESCRIPTION

Classes that implement the Backend interface can be used in conjuction
with the BaseCache class to create cache classes.  It is important
that classes that implement Backend do not presume that they are
storing any particular type of data, or even that they are being used
by a class that implements the Cache interface.

=head1 METHODS

=over

=item B<new( )>

Construct a new instance of the backend

=item B<delete_key( $namespace, $key )>

Remove the data associated with I<$key> from the I<$namespace>.

=item B<delete_namespace( $namespace )>

Remove data associated with all keys in the I<$namespace>.

=item B<get_keys( $namespace )>

Return a list of all keys pointing to data in the I<$namespace>.

=item B<get_namespaces( )>

Return a list of all namespaces this backend knows about.

=item B<get_size( $namespace, $key )>

Return the size (in bytes) of the data associated with I<$key> in the
I<$namespace>.

=item B<restore( $namespace, $key )>

Return the data associated with I<$key> in the I<$namespace>.

=item B<store( $namespace, $key, $data )>

Associate the I<$data> with the I<$key> in the I<$namespace>.

=back

=head1 SEE ALSO

Cache::FileBackend, Cache::MemoryBackend, Cache::SharedMemoryBackend

=head1 AUTHOR

Original author: DeWitt Clinton <dewitt@unto.net>

Last author:     $Author: dclinton $

Copyright (C) 2001 DeWitt Clinton

=cut



