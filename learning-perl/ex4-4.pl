use common::sense;

sub greet {
    state $last = undef;

    print "Hi @_[0]! ";
    print (defined($last) ? "$last is also here!\n" : "You are the first one here!\n");
    $last = @_[0];
}

&greet( "Fred" );
&greet( "Barney" );
