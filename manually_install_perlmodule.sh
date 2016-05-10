# Build the perl module

perl Makefile.PL
# Checking if your kit is complete...
# Looks good
# Writing Makefile for XML::Parser::Expat
# Writing Makefile for XML::Parser
make
make test

# Install the perl module
make install
