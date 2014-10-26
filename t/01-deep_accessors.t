#!perl -T

use Test::More tests => 2;

use MooseX::DeepAccessors;

package Foo;
use Moose;
has 'blah' => (
    isa => 'Str',
    is => 'rw',
    required => 0,
);

package MyClass;

use Moose;
use MooseX::DeepAccessors;

has foo => (
    isa => 'Str',
    is => 'ro',
    required => 0,
);

has delegate => (
    isa => 'Foo',
    metaclass => 'MooseX::DeepAccessors',
    is => 'ro',
    default => sub { Foo->new },
    required => 0,
    lazy => 1,
    deep_accessors => {
        'bar' => { 'blah' => [ sub { $_[0]->foo }, ], },
    },
);

package Another;
use Test::More;
ok(my $myobj = MyClass->new( foo => "foobarbaz" ));
ok($myobj->bar); # equiv. to $myobj->delegate->blah( $myobj->foo );

1;
