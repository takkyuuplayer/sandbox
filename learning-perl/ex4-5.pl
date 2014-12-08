use common::sense;

sub greet {
    state @seen;
    @seen = () if not @seen;

    print "Hi @_[0]! ";
    print (@seen ? "I've seen: @seen\n" : "You are the first one here!\n");

    push @seen, @_[0];
}

&greet("Fred");
&greet("Barney");
&greet("Wilma");
&greet("Betty");

