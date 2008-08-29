use inc::Module::Install;

name     'MooseX-DeepAccessors';
all_from 'lib/MooseX/DeepAccessors.pm';
author   'Joel Bernstein <rataxis@cpan.org>';

build_requires 'Test::More';

auto_install;

WriteAll;

