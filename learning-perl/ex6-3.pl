use common::sense;

sub width {
    my $wid = 0;
    for (keys %ENV){
        my $len = length "\$ENV{$_}";
        $wid = $len if $wid < $len;
    }
    $wid;
}
for my $key (sort keys %ENV){
    my $width = &width();
    printf "%${width}s is $ENV{$key}\n", "\$ENV{$key}";
}
